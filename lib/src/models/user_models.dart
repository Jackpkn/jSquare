// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'kycmodel.dart';

class User {
  final String id;
  final String name;
  final String email;
  final String userName;
  final String password;
  final int? phone;
  final String? image;
  List<KycModel>? address;
 final List<dynamic> wishlist;
  final String type;
  final String token;
  final List<dynamic> cart;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.userName,
    required this.password,
     this.phone,
    required this.image,
    required this.address,
    required this.wishlist,
    required this.type,
    required this.token,
    required this.cart,

  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'userName': userName,
      'password': password,
      'phone': phone,
      'image': image,
      'address': address,
      'wishlist': wishlist,
      'type': type,
      'token': token,
      'cart': cart,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      userName: map['userName'] ?? '',
      password: map['password'] ?? '',
      phone: map['phone'] ?? 0,
      image: map['image'] ?? '',
      address: map['ratings'] != null
          ? List<KycModel>.from(
              map['ratings']?.map(
                (x) => KycModel.fromMap(x),
              ),
            )
          : null,
      wishlist: List<dynamic>.from((map['wishlist'] as List<dynamic>)),
      type: map['type'] ?? '',
      token: map['token'] ?? '',
      cart: List<Map<String, dynamic>>.from(
        map['cart']?.map(
          (x) => Map<String, dynamic>.from(x),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? userName,
    String? password,
    int? phone,
    String? image,
    List<KycModel>? address,
    List<dynamic>? wishlist,
    String? type,
    String? token,
    List<dynamic>? cart,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      userName: userName ?? this.userName,
      password: password ?? this.password,
      phone: phone ?? this.phone,
      image: image ?? this.image,
      address: address ?? this.address,
      wishlist: wishlist ?? this.wishlist,
      type: type ?? this.type,
      token: token ?? this.token,
      cart: cart ?? this.cart,
    );
  }
}