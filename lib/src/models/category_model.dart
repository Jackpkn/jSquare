import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class CategoryModel {
  final String? id ;
  final String types;
  final List<String> image;
  final String categoryName;
  final int strPrice;
  CategoryModel({
  this.id,
    required this.types,
    required this.image,
    required this.categoryName,
    required this.strPrice,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'types': types,
      'image': image,
      'categoryName': categoryName,
      'strPrice': strPrice,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['_id'] ,
      types: map['types'] ?? '',
      image: List<String>.from(map['image']),
      categoryName: map['categoryName'] ?? '',
      strPrice: map['strPrice'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
