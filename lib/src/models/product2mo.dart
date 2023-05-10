import 'package:get/get.dart';
import 'package:jsquare/src/models/rating.dart';

class Products {
  String? name;
  String? description;
  double? quantity;
  List<String>? images;
  String? category;
  double? price;
  int? like;
  int? disLike;
  //specification
  String? id;
  List<Rating>? rating;
  String? totalRating;
  var isFavorite = false.obs;
  Products({
    required this.name,
    required this.description,
    required this.quantity,
    required this.images,
    required this.category,
    required this.price,
    this.like,
    this.disLike,
    this.id,
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
      'totalRating': totalRating
    };
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['description'] = description;
    data['quantity'] = quantity;
    data['images'] = images;
    data['category'] = category;
    data['price'] = price;
    data['like'] = like;
    data['disLike'] = disLike;
    data['id'] = id;
    data['rating'] = rating?.map((r) => r.toJson()).toList();
    data['totalRating'] = totalRating;
    data['isFavorite'] = isFavorite.value;
    return data;
  }

  Products.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    quantity = json['quantity'];
    images = List.from(json['images']);
    category = json['category'];
    price = json['price'];
    like = json['like'];
    disLike = json['disLike'];
    id = json['id'];
    if (json['rating'] != null) {
      rating = List.from(json['rating'].map((x) => Rating.fromJson(x)));
    }
    totalRating = json['totalRating'];
    isFavorite = json['isFavorite'] ?? false;
  }

// Map<String, dynamic> toJson() { final Map<String, dynamic> data = <String, dynamic>{};
// data['name'] = name;
// data['description'] = description;
// data['quantity'] = quantity;
//  data['images'] = images;
//   data['category'] = category;
//   data['price'] = price;
//   data['like'] = like;
//   data['disLike'] = disLike;
//    data['id'] = id;
//     if (rating != null) { data['rating'] = rating!.map((v) => v.toJson()).toList(); } data['totalRating'] = totalRating; data['isFavorite'] = isFavorite; return data; }
//   // other methods

  factory Products.fromMap(Map<String, dynamic> map) {
    return Products(
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

  // String toJson() => json.encode(toMap());
}
