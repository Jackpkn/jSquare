class CartModal {
  String? image;
  String ?title;
  String ?desc;
  double ?price;
  int? quantity;

  CartModal({this.image, this.title, this.desc, this.price, this.quantity});

  CartModal.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    title = json['title'];
    desc = json['desc'];
    price = json['price'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['title'] = title;
    data['desc'] = desc;
    data['price'] = price;
    data['quantity'] = quantity;
    return data;
  }
}

final cartItems = [
  CartModal(
      image: "https://images.pexels.com/photos/3291250/pexels-photo-3291250.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      title: "Apple iMac All-In-One Desktop",
      desc: "60.96 cm (24-inch) (8-core Apple M1 chip/8 GB/256 GB), MJV93HN/A",
      price: 1712.34,
      quantity: 0),
  CartModal(
      image: "https://images.pexels.com/photos/3291250/pexels-photo-3291250.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      title: "SEIKO",
      desc: "Presage SRPD37J1",
      price: 557.84,
      quantity: 0),
  CartModal(
      image: "https://images.pexels.com/photos/3291250/pexels-photo-3291250.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      title: "Carpe Diem",
      desc: "Paperback – Import, 26 May 2009",
      price: 24.89,
      quantity: 0),
  CartModal(
      image: "https://images.pexels.com/photos/3291250/pexels-photo-3291250.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      title: "Xbox Wireless Controller",
      desc: "Carbon Black",
      price: 76.12,
      quantity: 0),
  CartModal(
      image: "https://images.pexels.com/photos/3291250/pexels-photo-3291250.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      title: "Nike Air Max 270",
      desc: "React Marathon Running Shoes/Sneakers Multi-Color DA2610-161",
      price: 120.00,
      quantity: 0),
  CartModal(
      image: "https://images.pexels.com/photos/3291250/pexels-photo-3291250.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      title: "Cockatoo Dumbbell",
      desc: "Rubber Coated Professional Hex Dumbbell Set",
      price: 78.56,
      quantity: 0),
  CartModal(
      image: "https://images.pexels.com/photos/3291250/pexels-photo-3291250.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      title: "Nivia Simbolo Football",
      desc: "Size 5 (White/Yellow)",
      price: 18.00,
      quantity: 0),
  CartModal(
      image: "https://images.pexels.com/photos/3291250/pexels-photo-3291250.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      title: "Checked Casual Shirt",
      desc: "Flying Machine Men Yellow & Blue Regular Fit",
      price: 21.45,
      quantity: 0),
  CartModal(
      image: "https://images.pexels.com/photos/3291250/pexels-photo-3291250.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      title: "Wolper Lounge Chair",
      desc: "Ivory Nude",
      price: 315.00,
      quantity: 0),
  CartModal(
      image: "https://images.pexels.com/photos/3291250/pexels-photo-3291250.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      title: "Sony WH-XB700 Wireless Bluetooth Headphones",
      desc:
          "Extra Bass Headphones with 30 Hours Battery Life, Passive Operation, Quick Charge, Headset with mic for Phone Calls with Alexa - (Black)",
      price: 128.26,
      quantity: 0),
  CartModal(
      image: "https://images.pexels.com/photos/3291250/pexels-photo-3291250.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      title: "Canon EOS M50 Mirrorless Camera",
      desc: "Camera with 15-45 mm Lens Kit",
      price: 756.22,
      quantity: 0),
];
