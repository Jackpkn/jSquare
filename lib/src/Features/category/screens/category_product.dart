// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jsquare/src/Features/User/Services/user_services.dart';
import 'package:jsquare/src/Features/category/services/category_services.dart';
import 'package:jsquare/src/models/productmodels.dart';
import 'package:jsquare/src/providers/user_provider.dart';
import '../../../GlobalWidgets/cached_network_image.dart';
import '../../../GlobalWidgets/container.dart';
import '../../../GlobalWidgets/rating.dart';
import '../../Product_Details/screens/product_details_page.dart';

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
    double totalRating = 0;
    // for (int i = 0; i < productList!.rating!.length; i++) {
    //   totalRating += data!.rating![i].star;
    //   if (data!.rating![i].userId == userProvider.user.id) {
    //     myRating = data!.rating![i].star;
    //   }
    // }
  }

  fetchCategoryProducts() async {
    productList = await categoryServices.fetchCategoryProducts(
        category: widget.category, context: context);
    setState(
      () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category),
      ),
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
                                               avgRating.round().toString(),
                                              style: const TextStyle(fontSize: 16),
                                            ),
                                            const SizedBox(
                                              width: 2,
                                            ),
                                            RatingButton(
                                              rating: avgRating,
                                            ),
                                            const Text('(1,499)')
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