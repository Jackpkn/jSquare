// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:jsquare/src/providers/user_provider.dart';

// import '../../GlobalWidgets/textbutton.dart';

// class ProductPage extends StatelessWidget {
//   ProductPage({super.key});
//   final user = Get.put(UserProvider()).user;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(15.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(
//                 height: 30,
//               ),
//               SizedBox(
//                 height: 15,
//                 child: Text(user.token),
//               ),
//               const SizedBox(
//                 height: 40,
//                 child: Text(
//                   'Appliances',
//                   style: textStyle,
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () {},
//                 child: const Text(
//                   'TVS',
//                   style: textStyle,
//                 ),
//               ),
//               const SizedBox(
//                 height: 5,
//               ),
//               GestureDetector(
//                 onTap: () {},
//                 child: const Text(
//                   'Refrigerators',
//                   style: textStyle,
//                 ),
//               ),
//               const SizedBox(
//                 height: 5,
//               ),
//               GestureDetector(
//                 onTap: () {},
//                 child: const Text(
//                   'Washing Machines',
//                   style: textStyle,
//                 ),
//               ),
//               const SizedBox(
//                 height: 5,
//               ),
//               GestureDetector(
//                 onTap: () {},
//                 child: const Text(
//                   'Microwave Oven',
//                   style: textStyle,
//                 ),
//               ),
//               const SizedBox(
//                 height: 5,
//               ),
//               GestureDetector(
//                 onTap: () {},
//                 child: const Text(
//                   'Water Purifiers',
//                   style: textStyle,
//                 ),
//               ),
//               const SizedBox(
//                 height: 50,
//               ),
//               const Text(
//                 'Furnitures',
//                 style: textStyle,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
