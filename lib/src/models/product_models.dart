class ProductModel {
  String? image;
  String? name;
  String? description;
  ProductModel({this.image, this.name, this.description});
}

List<ProductModel> productModel = [
  ProductModel(
    image:
        'https://cdn.pixabay.com/photo/2012/04/12/19/06/fridge-30212_1280.png',
    name: 'TVs',
    description: 'Starting from ₹500',
  ),
  ProductModel(
    image:
        'https://cdn.pixabay.com/photo/2012/04/12/19/06/fridge-30212_1280.png',
    name: 'Light',
    description: 'Starting from ₹500',
  ),
  ProductModel(
    image:
        'https://cdn.pixabay.com/photo/2012/04/12/19/06/fridge-30212_1280.png',
    name: 'Mango',
    description: 'Starting from ₹500',
  ),
  ProductModel(
    image:
        'https://cdn.pixabay.com/photo/2012/04/12/19/06/fridge-30212_1280.png',
    name: 'TVs',
    description: 'Starting from ₹500',
  ),
  ProductModel(
    image:
        'https://cdn.pixabay.com/photo/2012/04/12/19/06/fridge-30212_1280.png',
    name: 'TVs',
    description: 'Starting from ₹500',
  ),
  ProductModel(
    image:
        'https://cdn.pixabay.com/photo/2012/04/12/19/06/fridge-30212_1280.png',
    name: 'TVs',
    description: 'Starting from ₹500',
  ),
  ProductModel(
    image:
        'https://cdn.pixabay.com/photo/2012/04/12/19/06/fridge-30212_1280.png',
    name: 'TVs',
    description: 'Starting from ₹500',
  ),
  ProductModel(
    image:
        'https://cdn.pixabay.com/photo/2012/04/12/19/06/fridge-30212_1280.png',
    name: 'TVs',
    description: 'Starting from ₹500',
  ),
];

class SelectMonth {
  String? name;
  bool? isSelected = false;
  SelectMonth({
    this.name,
    this.isSelected,
  });
}

List<SelectMonth> selectMonth = [
  SelectMonth(name: 'New'),
  SelectMonth(name: 'Less than 1 month'),
  SelectMonth(name: 'Less than 2 month'),
  SelectMonth(name: 'Less than 2 month'),
];

class Resolution {
  String? name;
  bool? isSelected = false;
  Resolution({
    this.name,
    this.isSelected,
  });
}

List<Resolution> resolution = [
  Resolution(name: '8K'),
  Resolution(name: '4K'),
  Resolution(name: '1080P'),
  Resolution(name: '720p'),
];

class DisplaySize {
  String? name;
  bool? isSelected = false;
  DisplaySize({
    this.name,
    this.isSelected,
  });
}

List<DisplaySize> displaySize = [
  DisplaySize(name: '24"- 31"'),
  DisplaySize(name: '32"- 39"'),
  DisplaySize(name: '40"- 47"'),
  DisplaySize(name: '48"- 54"'),
  DisplaySize(name: '55"- &Above"'),
];

class Price {
  String? name;
  bool? isSelected = false;
  Price({
    this.name,
    this.isSelected,
  });
}

List<Price> price = [
  Price(name: 'Under Rs. 499 per month'),
  Price(name: 'Under Rs. 599 per month'),
  Price(name: 'Under Rs. 699 per month'),
  Price(name: 'Under Rs. 799 per month'),
  Price(name: 'Under Rs. 899 per month'),
];

class Brand {
  String? name;
  bool? isSelected = false;
  Brand({
    this.name,
    this.isSelected,
  });
}

List<Brand> brand = [
  Brand(name: 'Samsung'),
  Brand(name: 'LG'),
  Brand(name: 'Sony'),
  Brand(name: 'Redmi'),
];

// class CustomerReview {
//   String? name;
//   bool? isSelected = false;
//     RatingButton;
//   CustomerReview({
//     this.name,
//     this.isSelected,
//   });
// }
class Checkout {
  String? name;
  double? price;
  Checkout({this.name, this.price});
}

List<Checkout> checkout = [
  Checkout(name: 'Total', price: 1747),
  Checkout(name: 'GST(18%)', price: 314.46),
  Checkout(name: 'Discount(-10%)', price: 174.7),
  Checkout(name: 'Amount to be paid', price: 1888.76),
];
