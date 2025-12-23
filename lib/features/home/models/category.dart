import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable()
class CategoryImage {
  final int id;
  final int width;
  final int height;
  final int size;
  final String url;

  const CategoryImage({required this.id, required this.width, required this.height, required this.size, required this.url});

  factory CategoryImage.fromJson(Map<String, dynamic> json) => _$CategoryImageFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryImageToJson(this);
}

@JsonSerializable()
class Category {
  final int id;
  final String name;
  final String title;
  final int rank;
  final CategoryImage image;

  const Category({required this.id, required this.name, required this.title, required this.rank, required this.image});

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

@JsonSerializable()
class CategoriesResponse {
  final List<Category> data;

  const CategoriesResponse({required this.data});

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) => _$CategoriesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriesResponseToJson(this);
}
