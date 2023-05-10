// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CategoryModel {
  CategoryModel({
    this.id,
    required this.types,
    required this.image,
    required this.categoryName,
    required this.strPrice,
  });
  String? id;
  String? types;
  String? image;
  String? categoryName;
  int? strPrice;
//  object to map
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'types': types,
      'image': image,
      'categoryName': categoryName,
      'strPrice': strPrice,
    };
  }
  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    types = json['email'];
    image = json['image'];
    categoryName = json['categoryName'];
    strPrice = json['strPrice'];
  }

// object to map - json(encode)
// json decode -map - object
// map to object
  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['_id'],
      types: map['types'] ?? '',
      image: map['image'],
    categoryName: map['categoryName'] ?? '',
      strPrice: map['strPrice'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  // factory CategoryModel.fromJson(String source) =>
  //     CategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
