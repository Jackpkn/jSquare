import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jsquare/src/models/favourite_model.dart';

class FavoritesProvider with ChangeNotifier {
  List<Favorites> _favorites = [];
  List<Favorites> get favorites => _favorites;
  Future<void> fetchFavoritesById() async {
    try {
      http.Response response = await http.post(
        Uri.parse(''),
      );
      final json = jsonDecode(response.body);
      _favorites = List.from(json).map((e) => Favorites.fromJson(e)).toList();
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> toggleFavorite(Favorites favorites) async {
    favorites.isFavorite = !favorites.isFavorite;
    try {
      await http.put(
        Uri.parse('https://myapi/posts/${favorites.id}/favorite'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(favorites.toJson()),
      );

      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
    }
  } 
  List<Favorites> get favoritess => _favorites.where((fav) => fav.isFavorite).toList();
}
 