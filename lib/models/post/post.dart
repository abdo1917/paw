import 'package:freezed_annotation/freezed_annotation.dart';
part 'post.freezed.dart';
part 'post.g.dart';

@Freezed()
class Post with _$Post {
  const factory Post({
    required String userId,
    required String userName,
    required String postId,
    required String title,
    required String body,
    required DateTime timestamp,
    required String imaga,
    required List<String> tags,
    required String petCategory,
    required String petBreed,
    @Default(true) bool isImportant,
  }) = _Post;

  factory Post.fromJson(Map<String , dynamic> json) => _$PostFromJson(json);

}
