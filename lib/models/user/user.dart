import 'package:freezed_annotation/freezed_annotation.dart';
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