// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../../GlobalWidgets/cached_network_image.dart';
// import '../../../GlobalWidgets/container.dart';

// class Test extends StatefulWidget {
//   const Test({super.key});

//   @override
//   State<Test> createState() => _TestState();
// }

// class _TestState extends State<Test> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(children: [
//         PageView.builder(itemBuilder: (context, index){
//           return  SizedBox(
//                   height: 280,
//                   width: double.infinity,
//                   child: PageView.builder(
//                       itemCount: widget.data.images.length,

//                       // itemCount: ,
//                       onPageChanged: (value) {
//                         setState(() {
//                           currentIndex = value;
//                         });
//                       },
//                       scrollDirection: Axis.horizontal,
//                       controller: controller,
//                       itemBuilder: (context, index) {
//                         // print('jack${widget.data.like.toString()}');
//                         return Padding(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 10, vertical: 6),
//                           child: Stack(
//                             children: [
//                               SizedBox(
//                                 height: 240,
//                                 width: double.infinity,
//                                 child: CachedNetImage(
//                                   height: 250,
//                                   width: double.infinity,
//                                   imageUrl: widget.data.images[index],
//                                   // imageUrl: widget.data.images[index],
//                                 ),
//                               ),
//                               Positioned(
//                                 right: 5,
//                                 top: 6,
//                                 child: Obx(
//                                   () => GestureDetector(
//                                     onTap: () {
//                                       // userService.wishProduct(
//                                       //   product: widget.data,
//                                       // );

//                                       // widget.data.isFavorite.toggle();
//                                     },
//                                     child: const GlobalContainer(
//                                       height: 32,
//                                       width: 32,
//                                       radius: 50,
//                                       borderWidth: 1.3,
//                                       child: Icon(
//                                           Icons.favorite_border,
//                                         color:  
//                                              Colors.white,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         );
//                       }),
//                 ),
//         })
//       ]),
//     );
//   }
// }
