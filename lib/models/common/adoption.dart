import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:paw_in_out/models/pet/pet.dart';
part 'adoption.freezed.dart';
part 'adoption.g.dart';

@Freezed()
class Adoption with _$Adoption {
  const factory Adoption({
    required Pet pet,
    required String description,
    required String userName,
    required String userId,
    required String userImageUrl,
    @Default(true) bool isImportant,
  }) = _Adoption;

  factory Adoption.fromJson(Map<String , dynamic> json) => _$AdoptionFromJson(json);

}
