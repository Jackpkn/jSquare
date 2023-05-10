// import 'dart:async';

// import 'package:get/get.dart';
// import 'package:jsquare/src/Features/User/Services/user_services.dart';

// import '../../../models/productmodels.dart';

// class UserController extends GetxController {
//   UserServices userServices = UserServices();
//  final StreamController _controller = StreamController();
  
//   Stream<Product?> deleteAddToCartProduct({required Product product}) async* {
//     while (true) {
//       await Future.delayed(const Duration(seconds: 1));
//       _controller.sink
//           .add(userServices.deleteAddToCartProduct(product: product));
//     }
//   }

//   Stream decreaseQuantity(
//     Product product,
//   ) async* {
//     while (true) {
//       await Future.delayed(const Duration(seconds: 1));
//       yield await userServices.decreaseQuantity(product: product);
//     }
//   }

//   Stream increaseQuantity({required Product product}) async* {
//     while (true) {
//       await Future.delayed(const Duration(seconds: 1));
//       yield await userServices.increaseQuantity(product: product);
//     }
//   }

//   Stream placeOrder(
//       {required String address, required double totalSum}) async* {
//     while (true) {
//       await Future.delayed(const Duration(seconds: 1));
//       yield await userServices.placeOrder(address: address, totalSum: totalSum);
//     }
//   }
//   @override
//   void dispose() {
//    _controller.close();
//     super.dispose();
//   }
// }
