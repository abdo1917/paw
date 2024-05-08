// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adoption.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdoptionImpl _$$AdoptionImplFromJson(Map<String, dynamic> json) =>
    _$AdoptionImpl(
      pet: Pet.fromJson(json['pet'] as Map<String, dynamic>),
      description: json['description'] as String,
      userName: json['userName'] as String,
      userId: json['userId'] as String,
      userImageUrl: json['userImageUrl'] as String,
      isImportant: json['isImportant'] as bool? ?? true,
    );

Map<String, dynamic> _$$AdoptionImplToJson(_$AdoptionImpl instance) =>
    <String, dynamic>{
      'pet': instance.pet,
      'description': instance.description,
      'userName': instance.userName,
      'userId': instance.userId,
      'userImageUrl': instance.userImageUrl,
      'isImportant': instance.isImportant,
    };
