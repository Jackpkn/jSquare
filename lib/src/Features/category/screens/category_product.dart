// ignore_for_file: must_be_immutable
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:focused_menu_custom/focused_menu.dart';
import 'package:focused_menu_custom/modals.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jsquare/src/Features/User/Services/user_services.dart';
import 'package:jsquare/src/Features/category/services/category_services.dart';
import 'package:jsquare/src/models/productmodels.dart';
import 'package:jsquare/src/providers/user_provider.dart';
import '../../../GlobalWidgets/cached_network_image.dart';
import '../../../GlobalWidgets/container.dart';
import '../../../GlobalWidgets/home_appbar.dart';
import '../../../GlobalWidgets/rating.dart';
import '../../Product_Details/screens/product_details_page.dart';
import '../../Product_pages/filter.dart';

class CategoryProduct extends StatefulWidget {
  static const String routeName = 'category-product';
  String category;
  CategoryProduct({super.key, required this.category});
  @override
  State<CategoryProduct> createState() => _CategoryProductState();
}

class _CategoryProductState extends State<CategoryProduct> {
  List<Product>? productList;
  CategoryServices categoryServices = CategoryServices();
  double avgRating = 0;
  List<Product>? data;
  double totalRating = 0;
  // double avgRating = 0;
  double myRating = 0;
  UserServices userServices = Get.put(UserServices());
  UserProvider userProvider = Get.put(UserProvider());
  @override
  void initState() {
    super.initState();
    fetchCategoryProducts();
    // double totalRating = 0;
    // for (int i = 0; i < productList!.rating!.length; i++) {
    //   totalRating += data!.rating![i].star;
    //   if (data!.rating![i].userId == userProvider.user.id) {
    //     myRating = data!.rating![i].star;
    //   }
    // }
  }

  fetchCategoryProducts() async {
    productList = await categoryServices.fetchCategoryProducts(
      // category: widget.category,
      category: '${widget.category}&sort=-price',

      context: context,
    );
    setState(
      () {},
    );
  }

 
  fetchIncreasingPrice() async {
    productList = await categoryServices.fetchCategoryProducts(
      category: '${widget.category}&sort=price',
      context: context,
      // ''
    );
    setState(
      () {},
    );
  }

  fetchDecreasingPrice() async {
    productList = await categoryServices.fetchCategoryProducts(
      category: '${widget.category}&sort=-price',
      context: context,
    );
    setState(
      () {},
    );
  }

  fetchDecreasingRating() async {
    productList = await categoryServices.fetchCategoryProducts(
      category: '${widget.category}&sort=-ratings',
      context: context,
    );
    setState(
      () {},
    );
  }

  fetchIncreasingRating() async {
    productList = await categoryServices.fetchCategoryProducts(
      category: '${widget.category}&sort=ratings',
      context: context,
    );
    setState(
      () {},
    );
  }

  fetchIncreasingTvSize() async {
    productList = await categoryServices.fetchCategoryProducts(
      category: '${widget.category}&sort=', // tv size
      context: context,
    );
    setState(
      () {},
    );
  }

  fetchDecreasingTvSize() async {
    productList = await categoryServices.fetchCategoryProducts(
      category: '${widget.category}&sort=-price', //tv size
      context: context,
    );
    setState(
      () {},
    );
  }

  //
  //
  File? image;
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      debugPrint('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      body: productList == null
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.green,
              ),
            )
          : SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: <Widget>[
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FocusedMenuHolder(
                          menuWidth: MediaQuery.of(context).size.width * 0.44,
                          // blurSize: 5.0,
                          menuItemExtent: 40,
                          menuBoxDecoration: const BoxDecoration(
                            // color: Colors.grey,
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                20.0,
                              ),
                            ),
                          ),
                          duration: const Duration(milliseconds: 100),
                          animateMenuItems: true,
                          blurBackgroundColor: Colors.black54,
                          openWithTap:
                              true, // Open Focused-Menu on Tap rather than Long Press
                          menuOffset:
                              10.0, // Offset value to show menuItem from the selected item
                          bottomOffsetHeight: 70.0,
                          menuItems: [
                            FocusedMenuItem(
                              title: const Text("Price"),
                              trailingIcon: const Icon(Icons.open_in_new),
                              onPressed: () {
                                fetchIncreasingPrice();
                              },
                            ),
                            FocusedMenuItem(
                                title: const Text("Ratings"),
                                trailingIcon: const Icon(Icons.arrow_downward),
                                onPressed: () {}),
                            FocusedMenuItem(
                              title: const Text("TV Size"),
                              trailingIcon: const Icon(Icons.favorite_border),
                              onPressed: () {},
                            ),
                            FocusedMenuItem(
                              title: const Text(
                                "Months used",
                              ),
                              trailingIcon: const Icon(
                                Icons.delete,
                              ),
                              onPressed: () {},
                            ),
                          ],
                          onPressed: () {},
                          child: GlobalContainer(
                            height: 33,
                            width: MediaQuery.of(context).size.width * 0.47,
                            borderWidth: 1,
                            radius: 8,
                            color: Colors.black,
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.sort,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Sort BY',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                      onTap: (){
                         Get.to(const Filter());
                        },
                        child: GlobalContainer(
                          height: 33,
                          width: MediaQuery.of(context).size.width * 0.47,
                          borderWidth: 1,
                          radius: 8,
                          color: Colors.black,
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.filter_alt,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 14,
                              ),
                              Text(
                                'Filter',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: productList!.length,
                    itemBuilder: (context, index) {
                      final data = productList![index];
                      double totalRating = 0;
                      for (int i = 0; i < data.rating!.length; i++) {
                        totalRating += data.rating![i].star;
                        if (data.rating![i].userId == userProvider.user.id) {
                          myRating = data.rating![i].star;
                        }
                      }
                      if (totalRating != 0) {
                        avgRating = totalRating / data.rating!.length;
                      }
                    
                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 3, right: 3, bottom: 9, top: 9),
                        child: SizedBox(
                          height: 190,
                          child: Row(
                            children: [
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
                                      imageUrl: data.images[0],
                                      height: 190,
                                      width: MediaQuery.of(context).size.width *
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
                                              color:
                                                  userServices.isFavourite.value
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.48,
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment: Alignment.topCenter,
                                        child: Text(
                                          data.description.toString(),
                                          style: const TextStyle(
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Row(
                                          children: [
                                            Text(
                                              avgRating
                                                  .toStringAsFixed(1)
                                                  .toString(),
                                              style:
                                                  const TextStyle(fontSize: 16),
                                            ),
                                            const SizedBox(
                                              width: 2,
                                            ),
                                            RatingButton(
                                              rating: avgRating,
                                            ),
                                            Text('(${data.rating!.length})')
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
                                          '₹${data.price.toString()} per month',
                                          style: const TextStyle(fontSize: 18),
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
                                              product: data,
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
                      //  ProductCategoryWidget(
                      //   productImage: data.images[0],
                      //   productName: data.name,
                      //   productPrice: data.price.toString(),
                      //   onPressed: () {
                      //     Get.to(
                      //       ProductDetails(
                      //         data: data,
                      //       ),
                      //     );
                      //   },
                      // );
                    },
                  ),
                ],
              ),
            ),
    );
  }
}
// flutter Node js  Authontication Second
