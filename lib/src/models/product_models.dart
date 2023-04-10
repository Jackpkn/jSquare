class ProductModel {
  String? image;
  String? name;
  String? description;
  ProductModel({this.image, this.name, this.description});
}

List<ProductModel> productModel = [
  ProductModel(
    image:
        'https://st.depositphotos.com/2208320/2099/v/450/depositphotos_20992801-stock-illustration-refrigerator-vector-vector-illustration.jpg',
    name: 'Fridges',
    description: 'Starting from ₹500',
  ),
  ProductModel(
    image:
        'https://st.depositphotos.com/2133879/3047/v/600/depositphotos_30476781-stock-illustration-washing-machine.jpg',
    name: 'Washing Machines',
    description: 'Starting from ₹500',
  ),
  ProductModel(
    image:
        'https://static5.depositphotos.com/1005574/413/v/600/depositphotos_4130311-stock-illustration-tv-lcd.jpg',
    name: 'Refrigerators',
    description: 'Starting from ₹500',
  ),
  ProductModel(
    image:
        'https://st4.depositphotos.com/3097111/38442/v/600/depositphotos_384422118-stock-illustration-realistic-microwave-oven-steel-vector.jpg',
    name: 'TVs',
    description: 'Starting from ₹600',
  ),
  ProductModel(
    image:
        'https://st4.depositphotos.com/3097111/38442/v/600/depositphotos_384422118-stock-illustration-realistic-microwave-oven-steel-vector.jpg',
    name: 'Microwave Ovens',
    description: 'Starting from ₹400',
  ),
  ProductModel(
    image:
        'https://st4.depositphotos.com/3097111/38442/v/600/depositphotos_384422118-stock-illustration-realistic-microwave-oven-steel-vector.jpg',
    name: 'Water Purifiers',
    description: 'Starting from ₹340',
  ),
];

class Furniture {
  String? image;
  String? name;
  String? description;
  Furniture({this.image, this.name, this.description});
}

List<Furniture> furniture = [
  Furniture(
      image:
          'https://st4.depositphotos.com/3097111/38442/v/600/depositphotos_384422118-stock-illustration-realistic-microwave-oven-steel-vector.jpg',
      name: 'Beds',
      description: 'Starting from ₹340'),
  Furniture(
      image:
          'https://st4.depositphotos.com/3097111/38442/v/600/depositphotos_384422118-stock-illustration-realistic-microwave-oven-steel-vector.jpg',
      name: 'Sofas',
      description: 'Starting from ₹840'),
  Furniture(
      image:
          'https://st4.depositphotos.com/3097111/38442/v/600/depositphotos_384422118-stock-illustration-realistic-microwave-oven-steel-vector.jpg',
      name: 'Wardrobes',
      description: 'Starting from ₹640'),
  Furniture(
      image:
          'https://st4.depositphotos.com/3097111/38442/v/600/depositphotos_384422118-stock-illustration-realistic-microwave-oven-steel-vector.jpg',
      name: 'Chairs',
      description: 'Starting from ₹640'),
  Furniture(
      image:
          'https://st4.depositphotos.com/3097111/38442/v/600/depositphotos_384422118-stock-illustration-realistic-microwave-oven-steel-vector.jpg',
      name: 'Tables',
      description: 'Starting from ₹540'),
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

class Models {
  Map<String, String>? image;
  Map<String, Map<String, String>>? images;
  Models({this.image, this.images});
}

List<Models> list = [
  Models(image: {
    'image': 'image',
  }, images: {
    'name': {
      "jack": "pawan",
    },
  }),
];
