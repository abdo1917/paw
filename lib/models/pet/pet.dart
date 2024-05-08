import 'package:freezed_annotation/freezed_annotation.dart';
part 'pet.freezed.dart';
part 'pet.g.dart';

@Freezed()
class Pet with _$Pet {
  const factory Pet({
    required String petId,
    required String petName,
    required String userId,
    required String imageUrl,
    required String age,
    required String weight,
    required String gender,
    required String petType,
    required String breed,
    @Default(true) bool isImportant,
  }) = _Pet;

  factory Pet.fromJson(Map<String , dynamic> json) => _$PetFromJson(json);

}
