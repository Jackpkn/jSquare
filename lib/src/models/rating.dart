import 'dart:convert';

class Rating {
  final String userId;
  final double star;
  final String message;
  Rating({
    required this.userId,
    required this.star,
    required this.message
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'star': star,
      'message': message
    };
  }

  factory Rating.fromMap(Map<String, dynamic> map) {
    return Rating(
      userId: map['userId'] ?? '',
      star: map['star']?.toDouble() ?? 0.0,
      message: map['message']?? ''
    );
  }

  String toJson() => json.encode(toMap());

  factory Rating.fromJson(String source) => Rating.fromMap(json.decode(source));
}