// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      userId: json['userId'] as String,
      userName: json['userName'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      adress: json['adress'] as String,
      imageUrl: json['imageUrl'] as String?,
      bio: json['bio'] as String,
      isImportant: json['isImportant'] as bool? ?? true,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'userName': instance.userName,
      'email': instance.email,
      'phone': instance.phone,
      'adress': instance.adress,
      'imageUrl': instance.imageUrl,
      'bio': instance.bio,
      'isImportant': instance.isImportant,
    };
