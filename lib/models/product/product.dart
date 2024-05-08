import 'package:freezed_annotation/freezed_annotation.dart';
part 'product.freezed.dart';
part 'product.g.dart';

@Freezed()
class Product with _$Product {
  const factory Product({
    required String name,
    required String productId,
    required String price,
    required String avgRating,
    @Default(true) bool isImportant,
  }) = _Product;

  factory Product.fromJson(Map<String , dynamic> json) => _$ProductFromJson(json);

}
