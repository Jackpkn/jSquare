// ignore_for_file: must_be_immutable
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jsquare/src/Features/category/services/category_services.dart';
import 'package:provider/provider.dart';

import '../../../GlobalWidgets/allreview.dart';
import '../../../GlobalWidgets/cached_network_image.dart';
import '../../../GlobalWidgets/container.dart';
import '../../../GlobalWidgets/home_appbar.dart';
import '../../../GlobalWidgets/rating.dart';
import '../../../models/productmodels.dart';
import '../../../providers/user_provider.dart';
import '../../User/Services/user_services.dart';
import '../widgets/rating_page.dart';

class ProductDetails extends StatefulWidget {
  static const String routeName = 'productDetails';

  Product data;

  ProductDetails({
    super.key,
    required this.data,
  });

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int currentIndex = 0;
  CategoryServices categoryServices = CategoryServices();
  final PageController controller = PageController();
  double avgRating = 0;
  double myRating = 0;
  // UserProvider userProvider = Get.put(UserProvider());
  // final userProvider = Provider.of<UserProvider>(context);
  void addToCart() {
    categoryServices.addToCart(
      product: widget.data,
      context: context,
    );
  }

  void likesProduct() {
    userService.likeProduct(product: widget.data, context: context);
  }

  void disLikeProduct() {
    userService.disLikeProduct(product: widget.data, context: context);
  }

  double fiveRating = 0;
  List fiveRateList = [];

  int fourRating = 0;
  List fourRateList = [];
  int threeRating = 0;
  List threeRateList = [];
  int twoRating = 0;
  List twoRateList = [];
  int oneRating = 0;
  List oneRateList = [];
  RxInt like = 0.obs;
  RxInt disLike = 0.obs;
  @override
  void initState() {
    super.initState();
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    double totalRating = 0;
    for (int i = 0; i < widget.data.rating!.length; i++) {
      totalRating += widget.data.rating![i].star;
      if (widget.data.rating![i].userId == userProvider.user.id) {
        myRating = widget.data.rating![i].star;
      }
    }
    if (totalRating != 0) {
      avgRating = totalRating / widget.data.rating!.length;
    }
    // five rating
    for (int i = 0; i < widget.data.rating!.length; i++) {
      if (widget.data.rating![i].star == 5) {
        fiveRating++;
        fiveRateList.add(widget.data.rating![i].message);
      }
    }

    for (int i = 0; i < widget.data.rating!.length; i++) {
      if (widget.data.rating![i].star == 4) {
        fourRating++;
        fourRateList.add(widget.data.rating![i].message);
      }
    }

    // three rating
    for (int i = 0; i < widget.data.rating!.length; i++) {
      if (widget.data.rating![i].star == 3) {
        threeRating++;
        threeRateList.add(widget.data.rating![i].message);
      }
    }
    // print(widget.data.like);
    // two rating
    for (int i = 0; i < widget.data.rating!.length; i++) {
      if (widget.data.rating![i].star == 2) {
        twoRating++;
        twoRateList.add(widget.data.rating![i].message);
      }
    }
    //one rating
    for (int i = 0; i < widget.data.rating!.length; i++) {
      if (widget.data.rating![i].star == 1) {
        oneRating++;
        threeRateList.add(widget.data.rating![i].message);
      }
    }
  }

  UserServices userService = Get.put(UserServices());
  List list = [
    {"Brand": "Samsung"},
    {"Display size": "55 inches"},
    {"Panel": "HDR 10+"},
    {"Display Technology": "LED"},
    {"Resolution": "3850 X 2160 pixels"},
  ];
  // bool isProductIdExists(String? id) {
  //   for (var i in productData) {
  //     if (i['product']['_id'] == id) {
  //       return true;
  //     }
  //   }
  //   return false;
  // }

  bool isProductIdExists(String? id) {
    final userProvider = Provider.of<UserProvider>(context);
    List productData = userProvider.user.cart;

    for (var i in productData) {
      if (i['product']['_id'] == id) {
        return true;
      }
    }
    return false;
  }

  // bool isLikedProduct(String? id) {
  //   final productProvider =
  //       Provider.of<ProductProvider>(context, listen: false);

  //   final userProvider = Provider.of<UserProvider>(context);
  //   List productData = userProvider.user.cart;
  //   for (var i = 0; i < productProvider.product.length; i++) {

  //   }

  //   // for (var i in productData) {}
  // }
 
  @override
  Widget build(BuildContext context) {
   
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 187, 179, 179),
        appBar: appbar(context: context),
        // appBar: AppBar(),
        body: SingleChildScrollView(
          // physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 5,
              right: 5,
              bottom: 20,
              top: 9,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 280,
                  width: double.infinity,
                  child: PageView.builder(
                      itemCount: widget.data.images.length,

                      // itemCount: ,
                      onPageChanged: (value) {
                        setState(() {
                          currentIndex = value;
                        });
                      },
                      scrollDirection: Axis.horizontal,
                      controller: controller,
                      itemBuilder: (context, index) {
                        // print('jack${widget.data.like.toString()}');
                        like.value = widget.data.like!;
                        // print(like);
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 6),
                          child: Stack(
                            children: [
                              SizedBox(
                                height: 240,
                                width: double.infinity,
                                child: CachedNetImage(
                                  height: 250,
                                  width: double.infinity,
                                  imageUrl: widget.data.images[index],
                                  // imageUrl: widget.data.images[index],
                                ),
                              ),
                              Positioned(
                                right: 5,
                                top: 6,
                                child: Obx(
                                  () => GestureDetector(
                                    onTap: () {
                                      userService.wishProduct(
                                        product: widget.data,
                                        context: context,
                                      );

                                      widget.data.isFavorite.toggle();
                                    },
                                    child: GlobalContainer(
                                      height: 32,
                                      width: 32,
                                      radius: 50,
                                      borderWidth: 1.3,
                                      child: Icon(
                                        widget.data.isFavorite.value
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        color: widget.data.isFavorite.value
                                            ? Colors.pink
                                            : Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < widget.data.images.length; i++)
                      buildIndicator(currentIndex == i)
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                    left: 16,
                    right: 16,
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      widget.data.description.toString(),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 9,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      avgRating.toStringAsFixed(1).toString(),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    RatingButton(
                      rating: avgRating,
                      ignoreGestures: true,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text('(${widget.data.rating!.length})'),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Align(
                  child: Text(
                    "₹${widget.data.price} Per month",
                    style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w400,
                      fontSize: 30,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 9,
                ),
                isProductIdExists(widget.data.id)
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: GlobalContainer(
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                          radius: 30,
                          borderWidth: 1.2,
                          color: Colors.white,
                          child: const Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Added',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: GestureDetector(
                          onTap: () {
                            addToCart();
                          },
                          child: GlobalContainer(
                            height: 60,
                            width: MediaQuery.of(context).size.width,
                            radius: 30,
                            borderWidth: 1.2,
                            color: Colors.white,
                            child: const Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Add to Cart',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GlobalContainer(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    radius: 30,
                    borderWidth: 1.2,
                    color: Colors.white,
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Compare',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 8, left: 9, bottom: 8),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Product details',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 4,
                    right: 4,
                  ),
                  child: Table(
                    border: TableBorder.symmetric(
                        inside: const BorderSide(width: 1, color: Colors.blue),
                        outside: const BorderSide(width: 1)),
                    // defaultColumnWidth: const FixedColumnWidth(150),
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    children: [
                      for (var item in list)
                        for (var entry in item.entries)
                          if (entry.value.isNotEmpty)
                            TableRow(
                              children: [
                                Text(
                                  entry.key,
                                ),
                                Text(entry.value),
                              ],
                            )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Ratings & Reviews',
                        // '$fiveRating',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          // shape: BoxShape.circle,
                          // backgroundColor: Colors.purple,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          textStyle: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          Get.to(
                            RatingScreen(
                              product: widget.data,
                            ),
                          );
                        },
                        child: const Text(
                          'Rate Product',
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                Text(
                  // 'The English Wikipedia is, with the Simple English Wikipedia, one of two English-language editions of Wikipedia, an online encyclopedia. It was founded on January 15, 2001, as Wikipedia first edition, and, as of February 15, 2023, has the most articles of any edition, at 6,618,258. As of February 2023, 10.9% of articles in all   belong to the English-language edition;',
                  widget.data.description,
                  style: const TextStyle(
                    // color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0,
                  ),
                ),
                const SizedBox(
                  height: 9,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      color: Colors.black,
                      width: 120,
                      child: const Text(
                        'Jayant Guru shrivastava ',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                likesProduct();
                              },
                              child: const Icon(
                                Icons.thumb_up,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              widget.data.like.toString(),
                              // like.toString(),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                disLikeProduct();
                              },
                              child: const Icon(
                                Icons.thumb_down,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(widget.data.disLike.toString()),
                          ],
                        )
                      ],
                    )
                  ],
                ),
                const Text('Certified AmoYou'),
                const Text(
                  'Related Products',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 19,
                  ),
                ),
                GestureDetector(
                  onTap: () => {
                    Get.to(
                      AllReviews(
                        data: widget.data,
                      ),
                    ),
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        // color: Colors.black,
                        width: 0.3,
                      ),
                    ),
                    child: ListTile(
                      title: Text(
                        'See all ${widget.data.rating!.length} reviews',
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: const Icon(CupertinoIcons.forward),
                    ),
                  ),
                ),
                GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    // crossAxisCount: 2,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 4,
                    // mainAxisExtent: 370,
                    crossAxisCount: 2,
                    mainAxisExtent: 310,
                  ),
                  padding: const EdgeInsets.all(10.0),
                  itemCount: 10,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      // height: 400,
                      color: const Color.fromARGB(255, 169, 176, 169),
                      // margin: const EdgeInsets.only(
                      //     left: 2, right: 2, bottom: 3, top: 2),
                      padding:
                          const EdgeInsets.only(left: 1, right: 1, bottom: 1),
                      width: MediaQuery.of(context).size.width * 0.48,
                      child: Stack(
                        children: [
                          Container(
                            height: 170,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  'https://cdn.pixabay.com/photo/2023/03/29/08/19/tulips-7884877_1280.jpg',
                                ),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 98),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Samsung 55 Inches 4k Neo Series Ultra HD Smart LED TV',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 34,
                            right: 2,
                            left: 3,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  avgRating.toStringAsFixed(1).toString(),
                                  style: const TextStyle(fontSize: 16),
                                ),
                                const SizedBox(
                                  width: 2,
                                ),
                                RatingButton(
                                  rating: avgRating,
                                  ignoreGestures: true,
                                ),
                                // const Text(
                                //   '1,499',
                                //   style: TextStyle(fontSize: 10),
                                // ),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 1,
                            left: 3,
                            child: GestureDetector(
                              onTap: () {},
                              child: const GlobalContainer(
                                height: 35,
                                width: 181,
                                borderWidth: 1.4,
                                radius: 10,
                                color: Colors.white,
                                child: Text(
                                  'Add to Cart',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildIndicator(bool isSelected) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1),
      child: Container(
        height: isSelected ? 9 : 7,
        width: isSelected ? 9 : 7,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected
              ? Colors.black
              : const Color.fromARGB(
                  255,
                  189,
                  185,
                  185,
                ),
        ),
      ),
    );
  }
}

 
/// ? List.
 // productList data will come int eh list fist take productList and update on every instance changeNotifier 