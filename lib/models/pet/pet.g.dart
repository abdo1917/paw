// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PetImpl _$$PetImplFromJson(Map<String, dynamic> json) => _$PetImpl(
      petId: json['petId'] as String,
      petName: json['petName'] as String,
      userId: json['userId'] as String,
      imageUrl: json['imageUrl'] as String,
      age: json['age'] as String,
      weight: json['weight'] as String,
      gender: json['gender'] as String,
      petType: json['petType'] as String,
      breed: json['breed'] as String,
      isImportant: json['isImportant'] as bool? ?? true,
    );

Map<String, dynamic> _$$PetImplToJson(_$PetImpl instance) => <String, dynamic>{
      'petId': instance.petId,
      'petName': instance.petName,
      'userId': instance.userId,
      'imageUrl': instance.imageUrl,
      'age': instance.age,
      'weight': instance.weight,
      'gender': instance.gender,
      'petType': instance.petType,
      'breed': instance.breed,
      'isImportant': instance.isImportant,
    };
