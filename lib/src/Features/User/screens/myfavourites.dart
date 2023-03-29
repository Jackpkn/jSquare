import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:jsquare/src/Features/User/Services/user_services.dart';
import 'package:jsquare/src/Features/category/services/category_services.dart';
import 'package:jsquare/src/providers/user_provider.dart';
import 'package:http/http.dart' as http;

import '../../../GlobalWidgets/cached_network_image.dart';
import '../../../GlobalWidgets/container.dart';
import '../../../GlobalWidgets/rating.dart';
import '../../../constants/httperror_handling.dart';
import '../../Product_Details/screens/product_details_page.dart';

class FavouritesPage extends StatefulWidget {
  static const String routeName = 'favourites-page';
  const FavouritesPage({super.key});

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  UserProvider userProvider = Get.put(UserProvider());
  List<dynamic> products = [];
  getWishProduct() async {
    try {
      const url = 'http://10.2.100.41:3000/api/getWishProduct';
      http.Response response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
      );
      httpErrorHandle(
        response: response,
        onSuccess: () {
          final List<dynamic> parsed = json.decode(response.body)['wishlist'];

          setState(() {
            products = parsed;
          });
          debugPrint(parsed.toString());
        },
      );
    } catch (e) {
      debugPrint(e.toString());
      EasyLoading.showError(e.toString());
    }
  }
//  late StreamController _streamController;
//  late Timer _timer;
 

  @override
  void initState() {
    getWishProduct();
    super.initState();
  }

  UserServices userServices = Get.put(UserServices());
CategoryServices categoryServices =Get.put(CategoryServices());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Orders'),
      ),
      body: products != null
          ? SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final data = products[index];
                        //  print(data['name']);
                   
                    
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 3, right: 3, bottom: 9, top: 9),
                          child: SizedBox(
                            height: 190,
                            child: Row(
                              children: [
                              
                                //  const Text('jack'),
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed(
                                      ProductDetails.routeName,
                                      arguments: data,
                                    );
                                  },
                                  child: Stack(
                                    children: [
                                     
                                      CachedNetImage(
                                        imageUrl: data['images'][0],
                                        height: 190,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.48,
                                      ),
                                      Positioned(
                                        right: 5,
                                        top: 6,
                                        child: Obx(
                                          () => GestureDetector(
                                            onTap: () {
                                              userServices.wishProduct(
                                                product: data,
                                              );
                                        
                                              userServices.toggleChange();
                                            },
                                            child: GlobalContainer(
                                              height: 32,
                                              width: 32,
                                              radius: 50,
                                              borderWidth: 1.3,
                                              child: Icon(
                                                userServices.isFavourite.value
                                                    ? Icons.favorite
                                                    : Icons.favorite_border,
                                                color: userServices
                                                        .isFavourite.value
                                                    ? Colors.white
                                                    : Colors.red,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  child: SizedBox(
                                    height: 190,
                                    width: MediaQuery.of(context).size.width *
                                        0.48,
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.topCenter,
                                          child: Text(
                                            data['description'].toString(),
                                            style: const TextStyle(
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 6,
                                        ),
                                          const Align(
                                          alignment: Alignment.center,
                                          child: Row(
                                            children: [
                                                 
                                              Text(
                                                '5',
                                                style: TextStyle(fontSize: 16),
                                              ),
                                              SizedBox(
                                                width: 2,
                                              ),
                                              RatingButton(
                                                rating: 5,
                                              ),
                                              Text('(1,499)')
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 6,
                                        ),
                                        Positioned(
                                          top: 128,
                                          left: 5,
                                          child: Text(
                                            '₹${data['price'].toString()} per month',
                                            style:
                                                const TextStyle(fontSize: 18),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 6,
                                        ),
                                        Positioned(
                                          bottom: 1,
                                          right: 1,
                                          left: 3,
                                          child: GestureDetector(
                                            onTap: () {
                                              categoryServices.addToCart(
                                                product: data['id'],
                                              );
                                            },
                                            child: const GlobalContainer(
                                              height: 30,
                                              width: 181,
                                              borderWidth: 1.4,
                                              radius: 10,
                                              color: Colors.white,
                                              child: Text(
                                                'Add to Cart',
                                                style: TextStyle(fontSize: 18),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                ],
              ),
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
