// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:get/get.dart';

import 'package:jsquare/src/models/rating.dart';

class Product {
  final String name;
  final String description;
  final double quantity;
  final List<String> images;
  final String category;
  final double price;
  final int? like;
  final int? disLike;
  //specification
  final String? id;
  // final List<Rating>? rating;
  final List<Rating>? rating;
  List <dynamic> ?reviews;
  //
  final String? totalRating;
  var isFavorite = false.obs;
  Product({
    required this.name,
    required this.description,
    required this.quantity,
    required this.images,
    required this.category,
    required this.price,
    this.like,
    this.disLike,
    this.id,
    this.reviews,
    this.rating,
    this.totalRating,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'quantity': quantity,
      'images': images,
      'category': category,
      'price': price,
      'like': like,
      'disLike': disLike,
      'id': id,
      'rating': rating,
      'reviews': reviews,
      'totalRating': totalRating
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
        name: map['name'] ?? '',
        description: map['description'] ?? '',
        quantity: map['quantity']?.toDouble() ?? 0.0,
        images: List<String>.from(map['images']),
        category: map['category'] ?? '',
        price: map['price']?.toDouble() ?? 0.0,
        like: map['like']?.toInt() ?? 0,
        disLike: map['disLike']?.toInt() ?? 0,
        id: map['_id'],
        rating: map['ratings'] != null
            ? List<Rating>.from(
                map['ratings']?.map(
                  (x) => Rating.fromMap(x),
                ),
              )
            : null,
        totalRating: map['totalRating'] ?? '');
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));

  Product copyWith({
    String? name,
    String? description,
    double? quantity,
    List<String>? images,
    String? category,
    double? price,
    int? like,
    int? disLike,
    String? id,
    List<Rating>? rating,
    String? totalRating,
     
  }) {
    return Product(
      name: name ?? this.name,
      description: description ?? this.description,
      quantity: quantity ?? this.quantity,
      images: images ?? this.images,
      category: category ?? this.category,
      price: price ?? this.price,
      like: like ?? this.like,
      disLike: disLike ?? this.disLike,
      id: id ?? this.id,
      rating: rating ?? this.rating,
      totalRating: totalRating ?? this.totalRating,
      
    );
  }
}

// rating
// cart List<dynamic> rating
// rating : List<Map<String, dynamic>> .from(map['rating']?.map((x)=>Map<String, dynamic>
// )

//! favorite page , orders page rating and and reviews 
//? 