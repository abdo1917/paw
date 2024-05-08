import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:paw_in_out/firebase_options.dart';
import 'package:paw_in_out/my_app.dart';

void main ()async{
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseApp app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}



/*
*
*
* import 'package:freezed_annotation/freezed_annotation.dart';
part 'user.freezed.dart';
part 'user.g.dart';

@Freezed()
class AppUser with _$User {
  const factory AppUser({
    required String userId,
    required String userName,
    required String email,
    required String phone,
    required String adress,
    String? imageUrl,
    required String bio,
    @Default(true) bool isImportant,
  }) = _User;

  factory AppUser.fromJson(Map<String , dynamic> json) => _$UserFromJson(json);

}

*
* */