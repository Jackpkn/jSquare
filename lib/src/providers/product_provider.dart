import 'package:flutter/widgets.dart';
import 'package:jsquare/src/models/productmodels.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> _product = [];
  List<Product> get product => _product;
  setProductModel(List<Product> products) {
    _product = products;
    notifyListeners();
  }
}
