// import 'package:dartz/dartz.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:paw_in_out/models/user/user.dart';
// import 'package:paw_in_out/providers/app_provider.dart';
// import 'package:paw_in_out/services/repository.dart';
// part 'auth.freezed.dart';
//
// @Freezed()
// class AuthState with _$AuthState {
//   const factory AuthState.loading() = _Loading;
//   const factory AuthState.authenticated({required AppUser user}) = _Authenticated;
//   const factory AuthState.unAuthenticated() = _UnAuthenticated;
// }
//
//
// class AuthVM extends StateNotifier<AuthState> {
//   AppRepository repo;
//
//
//
//   AuthVM(ProviderRef ref)
//       : repo = ref.read(appRepositoryProvider),
//         super(AuthState.loading()) {
//     repo.auth.authStateChanges().listen(
//           (AppUser firebaseUser) {
//         if (firebaseUser == null) {
//           state = AuthState.unAuthenticated();
//           print('User is currently signed out!');
//         } else {
//           setting(firebaseUser);
//           print('User is signed in!');
//         }
//       } as void Function(User? event)?,
//     );
//   }
//
//   void setting(AppUser firebaseUser) async {
//     await setUser(firebaseUser: firebaseUser);
//   }
//
//   Future<void> setUser({required AppUser firebaseUser}) async {
//     final result =
//     await repo.setUser(firebaseUser: firebaseUser as User, uid: firebaseUser.userId);
//
//     if (result) {
//       final user = await repo.getLoggedInUser();
//       state = AuthState.authenticated(user: firebaseUser);
//     }
//   }
//
//   Future<Either<String, bool>> signInWithEmail(
//       {required Map<String, dynamic> form}) async {
//     final res = await repo.signInWithEmail(
//         email: form['email'], password: form['password']);
//
//     return res;
//   }
//
//   ///
//   Future<Either<String, bool>> signUpWithEmail(
//       Map<String, dynamic> form) async {
//     final res = await repo.createUserwithEmail(
//         email: form['email'], name: form['name'], password: form['password']);
//
//     return res;
//   }
//
//   Future<void> googleSignIn() async {
//     await repo.signInWithGoogle();
//   }
//
//   Future<void> signOut() async {
//     await repo.signOut();
//   }
// }
