// ignore_for_file: must_be_immutable, use_build_context_synchronously
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:focused_menu_custom/focused_menu.dart';
import 'package:focused_menu_custom/modals.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jsquare/src/Features/User/Services/user_services.dart';
import 'package:jsquare/src/Features/category/services/category_services.dart';
import 'package:jsquare/src/models/productmodels.dart';
import 'package:jsquare/src/providers/user_provider.dart';
import 'package:provider/provider.dart';
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
  // UserProvider userProvider = Get.put(UserProvider());

  @override
  void initState() {
    super.initState();
    fetch();
    fetchCategoryProducts();
  }

  fetchCategoryProducts() async {
    productList = await categoryServices.fetchCategoryProducts(
      category: widget.category,
      context: context,
    );
    setState(
      () {},
    );
  }

  final product = <Product>[].obs;
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

  fetch() async {
    product.value = await categoryServices.fetchCategoryProducts(
      category: widget.category,
      context: context,
    );
    // print(product.length);
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
  bool priceSort = true;
  void sortPriceFunction() async {
    if (priceSort) {
      productList = await categoryServices.fetchCategoryProducts(
        category: '${widget.category}&sort=price',
        context: context,
      );
      setState(
        () {},
      );
    } else {
      productList = await categoryServices.fetchCategoryProducts(
        category: '${widget.category}&sort=-price',
        context: context,
      );
      setState(() {});
    }
  }

  bool tvSize = false;

  void tvSizeSort() async {
    if (tvSize) {
      productList = await categoryServices.fetchCategoryProducts(
        category: '${widget.category}&sort=-size',
        context: context,
      );
      setState(
        () {},
      );
    } else {
      productList = await categoryServices.fetchCategoryProducts(
        category: '${widget.category}&sort=-size',
        context: context,
      );
      setState(
        () {},
      );
    }
  }

  File? image;
  bool isRating = false;
  void ratingSort() async {
    if (isRating) {
      productList = await categoryServices.fetchCategoryProducts(
        category: '${widget.category}&sort=ratings',
        context: context,
      );
      setState(
        () {},
      );
    } else {
      productList = await categoryServices.fetchCategoryProducts(
        category: '${widget.category}&sort=-ratings',
        context: context,
      );
      setState(() {});
    }
  }

  //
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
    final userProvider = Provider.of<UserProvider>(context);
    List productData = userProvider.user.cart;
    List favorite = userProvider.user.wishlist;
    bool isExist(String? id) {
      for (var i in favorite) {
        if (i == id) {
          return true;
        }
      }
      return false;
    }

    bool isProductIdExists(String? id) {
      for (var i in productData) {
        if (i['product']['_id'] == id) {
          return true;
        }
      }
      return false;
    }
    // print(productData);

    // ProductController productController = ProductController();
    // final productProvider =
    //     Provider.of<ProductProvider>(context, listen: true).product;
    //  print(productProvider.length);
    return Scaffold(
      appBar: appbar(context: context),
      backgroundColor: const Color.fromARGB(255, 1, 0, 0),
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
                          blurBackgroundColor:
                              const Color.fromARGB(136, 255, 255, 255),
                          openWithTap:
                              true, // Open Focused-Menu on Tap rather than Long Press
                          menuOffset:
                              10.0, // Offset value to show menuItem from the selected item
                          bottomOffsetHeight: 70.0,
                          menuItems: [
                            FocusedMenuItem(
                              title: const Text(
                                "Price",
                                style: TextStyle(color: Colors.black),
                              ),
                              trailingIcon: Icon(
                                priceSort
                                    ? LineAwesome.arrow_down_solid
                                    : Icons.arrow_upward,
                                size: 27,
                              ),
                              onPressed: () {
                                sortPriceFunction();
                                setState(() {
                                  priceSort = !priceSort;
                                });
                              },
                            ),
                            FocusedMenuItem(
                                title: const Text("Ratings",
                                    style: TextStyle(color: Colors.black)),
                                trailingIcon: Icon(isRating
                                    ? Icons.arrow_downward
                                    : Icons.arrow_upward),
                                onPressed: () {
                                  ratingSort();
                                }),
                            FocusedMenuItem(
                              title: const Text("TV Size",
                                  style: TextStyle(color: Colors.black)),
                              trailingIcon: Icon(
                                tvSize
                                    ? Icons.arrow_downward
                                    : Icons.arrow_upward,
                              ),
                              onPressed: () {
                                tvSizeSort();
                              },
                            ),
                            FocusedMenuItem(
                              title: const Text("Months used",
                                  style: TextStyle(color: Colors.black)),
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
                            color: const Color.fromARGB(255, 247, 247, 247),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.sort,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Sort BY',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(const Filter());
                        },
                        child: GlobalContainer(
                          height: 33,
                          width: MediaQuery.of(context).size.width * 0.47,
                          borderWidth: 1,
                          radius: 8,
                          color: const Color.fromARGB(255, 255, 255, 255),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.filter_alt,
                                color: Color.fromARGB(255, 7, 4, 4),
                              ),
                              SizedBox(
                                width: 14,
                              ),
                              Text(
                                'Filter',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 21, 12, 12)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4, right: 4),
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: productList!.length,
                      itemBuilder: (context, index) {
                        final data = productList![index];
                        // print(productProvider[index].category);
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
                        // final d = productProvider[index];
                        // final r = d.rating!.length;
                        // debugPrint(r.toString());
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 3, right: 3, bottom: 3, top: 3),
                          child: Container(
                            color: const Color.fromARGB(255, 59, 45, 45),
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
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.48,
                                      ),
                                      Positioned(
                                        right: 5,
                                        top: 6,
                                        child: GestureDetector(
                                          onTap: () {
                                            debugPrint(
                                              isExist(data.id).toString(),
                                            );
                                            userServices.wishProduct(
                                              product: data,
                                              context: context,
                                            );
                                            // data.isFavorite.toggle();
                                            // userServices.toggleChange();
                                          },
                                          child: GlobalContainer(
                                            height: 32,
                                            width: 32,
                                            radius: 50,
                                            borderWidth: 1.3,
                                            child: Icon(
                                              isExist(data.id.toString())
                                                  ? Icons.favorite
                                                  : Icons.favorite_border,
                                              color: isExist(data.id)
                                                  ? Colors.red
                                                  : Colors.white,
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
                                            data.description.toString(),
                                            style: const TextStyle(
                                              fontSize: 12,
                                                color: Colors.white,
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
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 4,
                                              ),
                                              RatingButton(
                                                rating: avgRating,
                                                ignoreGestures: true,
                                              ),
                                              Text(
                                                '(${data.rating!.length})',
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  
                                                ),
                                              )
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
                                            style: const TextStyle(
                                              fontSize: 15,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 6,
                                        ),
                                        isProductIdExists(data.id)
                                            ? const Positioned(
                                                bottom: 1,
                                                right: 1,
                                                left: 3,
                                                child: GlobalContainer(
                                                  height: 30,
                                                  width: 181,
                                                  borderWidth: 1.4,
                                                  radius: 10,
                                                  color: Colors.white,
                                                  child: Text(
                                                    'Added',
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                              )
                                            : Positioned(
                                                bottom: 1,
                                                right: 1,
                                                left: 3,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    categoryServices.addToCart(
                                                      product: data,
                                                      context: context,
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
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          color: Colors.black),
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
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
// flutter Node js  Authontication Second
