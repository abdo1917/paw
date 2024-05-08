// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      name: json['name'] as String,
      productId: json['productId'] as String,
      price: json['price'] as String,
      avgRating: json['avgRating'] as String,
      isImportant: json['isImportant'] as bool? ?? true,
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'productId': instance.productId,
      'price': instance.price,
      'avgRating': instance.avgRating,
      'isImportant': instance.isImportant,
    };
