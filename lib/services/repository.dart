// import 'dart:io';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:dartz/dartz.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:geoflutterfire2/geoflutterfire2.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:path/path.dart' as path;
// import 'package:paw_in_out/services/database.dart';
// import 'package:sembast/sembast.dart';
//
// import '../models/common/adoption.dart';
// import '../models/user/user.dart';
//
// class AppRepository {
//   /// GeoLocator Instance
//   final Geolocator geolocator = Geolocator();
//
//   /// Geostore instance
//   final geo = Geolocator();
//
//   /// Cloud Firestore instance
//   final firestore = FirebaseFirestore.instance;
//
//   /// Firebase Auth instance
//   final auth = FirebaseAuth.instance;
//
//   ///Firebase storage instance.
//   final firebaseStorage = FirebaseStorage.instance.ref();
//
//   /// Local Sembast instance
//   final Future<Database> _db = AppDatabase.instance.database;
//   final _store = stringMapStoreFactory.store('common_store');
//   static const USERKEY = 'userkey';
//
//   /// Sign In with Google Auth
//   Future<UserCredential> signInWithGoogle() async {
//     // Trigger the authentication flow
//     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
//
//     // Obtain the auth details from the request
//     final GoogleSignInAuthentication googleAuth =
//         await googleUser!.authentication;
//
//     // Create a new credential
//     final OAuthCredential credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth.accessToken,
//       idToken: googleAuth.idToken,
//     );
//
//     // Once signed in, return the UserCredential
//     return await auth.signInWithCredential(credential);
//   }
//
//   /// Create user with Email and Password
//   Future<Either<String, bool>> createUserwithEmail(
//       {required String email,
//       required String password,
//       required String name}) async {
//     try {
//       final UserCredential userCredential = await FirebaseAuth.instance
//           .createUserWithEmailAndPassword(email: email, password: password);
//
//       final user = AppUser(
//         userId: userCredential.user!.uid,
//         email: email,
//         userName: name,
//         phone: '',
//         adress: '',
//         bio: '',
//       );
//
//       await firestore
//           .collection('users')
//           .doc(userCredential.user!.uid)
//           .set(user.toJson());
//
//       await _store.record(USERKEY).put(await _db, user.toJson(), merge: true);
//
//       return right(true);
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         return left('The password provided is too weak.');
//       } else if (e.code == 'email-already-in-use') {
//         return left('An account already exists for that email.');
//       }
//       return left(e.toString());
//     } catch (e) {
//       print(e);
//       return left(e.toString());
//     }
//   }
//
//   /// SignIn with Email and Password verification
//   ///
//   Future<Either<String, bool>> signInWithEmail(
//       {required String email, password}) async {
//     try {
//       await FirebaseAuth.instance
//           .signInWithEmailAndPassword(email: email, password: password);
//
//       return right(true);
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//         return left('No user found for that email, try again');
//       } else if (e.code == 'wrong-password') {
//         return left('The credentials do not match, try again');
//       }
//       return left(e.toString());
//     }
//   }
//
//   Future<bool> setUser(
//       {required String uid, required User firebaseUser}) async {
//     try {
//       final result = await firestore.collection('users').doc(uid).get();
//       if (result.exists) {
//         /// Save to Local Storage
//         await _store.record(USERKEY).put(
//               await _db,
//               merge: true,
//               firebaseUser as Map<String, Object?>,
//             );
//
//         return true;
//       } else {
//         final user = AppUser(
//           userId: uid,
//           email: firebaseUser.email.toString(),
//           userName: firebaseUser.displayName.toString(),
//           phone: firebaseUser.phoneNumber.toString(),
//           imageUrl: firebaseUser.photoURL,
//           adress: '',
//           bio: '',
//         );
//
//         /// Save to firebase
//         await firestore.collection('users').doc(uid).set(user.toJson());
//
//         /// Save to local Storage
//         await _store.record(USERKEY).put(await _db, user.toJson(), merge: true);
//
//         return true;
//       }
//     } catch (e) {
//       print("$e");
//       return false;
//     }
//   }
//
//   /// Get the current Logged In user
//   Future<AppUser?> getLoggedInUser() async {
//     try {
//       final user = await _store.record(USERKEY).get(await _db);
//       print(user);
//       final appuser = AppUser.fromJson(user!);
//       return appuser;
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }
//
//   /// Sign out of the App
//   Future<void> signOut() async {
//     final res = await _store.record(USERKEY).delete(await _db);
//     print(res);
//     await GoogleSignIn().signOut();
//     await auth.signOut();
//   }
//
//   /// Get user profile from local database
//   Future<Future<AppUser?>> getUserProfile() async {
//     final user = getLoggedInUser();
//     return user;
//   }
//
//   /// update proileImage of a user
//   Future<AppUser?> updateImage(File image, String uid) async {
//     try {
//       var fileExtension = path.extension(image.path);
//       final storageRefrence = firebaseStorage.child('users/$uid$fileExtension');
//
//       await storageRefrence.putFile(image).catchError((err) {
//         print(err);
//         return;
//       });
//       String url = await storageRefrence.getDownloadURL();
//
//       await firestore.collection('users').doc(uid).update({'imageUrl': url});
//
//       final user = await firestore.collection('users').doc(uid).get();
//
//       final u = await _store
//           .record(USERKEY)
//           .put(await _db, user.reference as Map<String, Object?>, merge: true);
//
//       return AppUser.fromJson(u);
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }
//
//   /// update Profile details of user
//   Future<AppUser?> updateUserProfile(AppUser user, String uid) async {
//     try {
//       await firestore.collection('users').doc(uid).update(user.toJson());
//
//       final us = await firestore.collection('users').doc(uid).get();
//
//       final u = await _store
//           .record(USERKEY)
//           .put(await _db, user.toJson(), merge: true);
//
//       return AppUser.fromJson(u);
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }
//
//   Future<void> adoptionForm(String uid, Adoption adoptionForm) async {
//     //to get user current location
//     // GeoFirePoint _myLocation = await _getCurrentLocation();
//
//     /// TODO: Finish adoption form with geolocation
//   }
//
//   /// Get adoption list from nearby locations.
//   Stream<List<Adoption>?> adoptionList(double radius) async* {
//     try {
//       List<Adoption> availableAdoptions = [];
//
//       final GeoPoint? _myLocation = await _getCurrentLocation();
//       String field = 'location';
//       GeoFirePoint center = (await Geolocator.getCurrentPosition(
//           desiredAccuracy: LocationAccuracy.high)) as GeoFirePoint;
//       var collectionReference = firestore.collection('adoption');
//
//       // geo.collection(collectionRef: collectionReference)
//       //     .within(center: center, radius: radius, field: field)
//       //     .listen((List<DocumentSnapshot> docs) {
//       //   docs.forEach((d) {
//       //     Adoption a = Adoption.fromJson(d.data());
//       //     a.copyWith(distance: d.data()?['distance']);
//       //
//       //     availableAdoptions.add(a);
//       //   });
//       // });
//
//       yield availableAdoptions;
//     } catch (e) {
//       print(e);
//       yield null; //TODO: Replace with Either
//     }
//   }
//
//   /// Get the current Location of [AppUser]
//   Future<GeoPoint?> _getCurrentLocation() async {
//     try {
//       double latitude, longitude;
//
//       final position = await Geolocator.getCurrentPosition(
//           desiredAccuracy: LocationAccuracy.best);
//       latitude = position.latitude;
//       longitude = position.longitude;
//       GeoPoint myLocation = (await Geolocator.getCurrentPosition(
//           desiredAccuracy: LocationAccuracy.high)) as GeoPoint;
//       return myLocation;
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }
//
//   getuserdetails(var uid) async {
//     final result = await firestore.collection('users').doc(uid).get();
//     return result;
//   }
//
//   getpetdetails(var uid) async {
//     final result = await firestore.collection('petCategory').doc(uid).get();
//     return result;
//   }
// }
