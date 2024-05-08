// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostImpl _$$PostImplFromJson(Map<String, dynamic> json) => _$PostImpl(
      userId: json['userId'] as String,
      userName: json['userName'] as String,
      postId: json['postId'] as String,
      title: json['title'] as String,
      body: json['body'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      imaga: json['imaga'] as String,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      petCategory: json['petCategory'] as String,
      petBreed: json['petBreed'] as String,
      isImportant: json['isImportant'] as bool? ?? true,
    );

Map<String, dynamic> _$$PostImplToJson(_$PostImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'userName': instance.userName,
      'postId': instance.postId,
      'title': instance.title,
      'body': instance.body,
      'timestamp': instance.timestamp.toIso8601String(),
      'imaga': instance.imaga,
      'tags': instance.tags,
      'petCategory': instance.petCategory,
      'petBreed': instance.petBreed,
      'isImportant': instance.isImportant,
    };
