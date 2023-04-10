import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jsquare/src/Features/Home/controllers/home_controller.dart';
import 'package:jsquare/src/GlobalWidgets/home_appbar.dart';

import '../../../GlobalWidgets/cached_network_image.dart';
import '../../../models/category_model.dart';
import '../../../models/product_models.dart';
import '../../category/screens/category_product.dart';
import '../services/home_service_provider.dart';
import 'drawer_screen.dart';

class IntroPage extends StatefulWidget {
  static const String routeName = 'home-screen';
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  // TabController controller = TabController();

  /// List of Tab Bar Item
  List<String> items = [
    "Home",
    "Explore",
  ];

  /// List of body icon
  // List<Widget> routes = [
  //     TVsPage(),
  //     TVsPage(),
  //      TVsPage(),
  //     TVsPage(),
  // ];
  // int current = 0;
  void navigateToDealScreen(String category) {
    Get.toNamed(CategoryProduct.routeName, arguments: category);
  }

  final controller = Get.put(HomeController());
  List<CategoryModel>? categoryList;
  @override
  void initState() {
    super.initState();
    fetchCategoryProducts();
  }

  fetchCategoryProducts() async {
    final data = Get.put(CategoryProvider());
    categoryList = await data.getCategoryProduct();
    setState(
      () {},
    );
  }

  // UserProvider userProvider = Get.put(UserProvider());
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    // print(categoryList);
    //  context.read<CategoryProvider>();
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      drawer: HomeDrawer(),
      appBar: appbar(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Obx(
            () => Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        homeController.toggleTabs();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.all(5),
                        width: MediaQuery.of(context).size.width * 0.43,
                        height: 45,
                        decoration: BoxDecoration(
                          color: homeController.tabStatus.value
                              ? Colors.black
                              : Colors.white,
                          borderRadius: homeController.tabStatus.value
                              ? BorderRadius.circular(15)
                              : BorderRadius.circular(10),
                        ),
                        child: Text(
                          'Furniture',
                          style: TextStyle(
                            color: homeController.tabStatus.value
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    GestureDetector(
                      onTap: () {
                        homeController.toggleTabs();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.all(5),
                        width: MediaQuery.of(context).size.width * 0.47,
                        height: 45,
                        decoration: BoxDecoration(
                          color: homeController.tabStatus.value
                              ? Colors.white
                              : Colors.black,
                          borderRadius: homeController.tabStatus.value
                              ? BorderRadius.circular(15)
                              : BorderRadius.circular(10),
                        ),
                        child: Text(
                          'Appliances',
                          style: TextStyle(
                              color: homeController.tabStatus.value
                                  ?Colors.black
                                  : Colors.white
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                homeController.tabStatus.value
                    ? SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: SizedBox(
                          height: 900,
                          child: GridView.builder(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 3 / 2,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 4,
                                mainAxisExtent: 370,
                              ),
                              padding: const EdgeInsets.all(10.0),
                              itemCount: productModel.length,
                              itemBuilder: (ctx, i) {
                                return GestureDetector(
                                  onTap: () {
                                    navigateToDealScreen(
                                      productModel[i].name.toString(),
                                    );
                                  },
                                  child: SizedBox(
                                    height: 90,
                                    width: 90,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        CachedNetImage(
                                            imageUrl: productModel[i]
                                                .image
                                                .toString(),
                                            height: 267,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width),
                                        const SizedBox(
                                          height: 12,
                                        ),
                                        Text(
                                          productModel[i].name.toString(),
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 25,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        const SizedBox(
                                          height: 6,
                                        ),
                                        Text(
                                          productModel[i]
                                              .description
                                              .toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),
                      )
                    : SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: SizedBox(
                          // height: 900,
                          child: GridView.builder(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 3 / 2,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 4,
                              mainAxisExtent: 370,
                            ),
                            padding: const EdgeInsets.all(10.0),
                            itemCount: furniture.length,
                            itemBuilder: (ctx, i) {
                              return GestureDetector(
                                onTap: () {
                                  navigateToDealScreen(
                                    furniture[i].name.toString(),
                                  );
                                },
                                child: SizedBox(
                                  height: 90,
                                  width: 90,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      CachedNetImage(
                                          imageUrl:
                                              furniture[i].image.toString(),
                                          height: 267,
                                          width: MediaQuery.of(context)
                                              .size
                                              .width),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      Text(
                                        furniture[i].name.toString(),
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 25,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                        furniture[i].description.toString(),
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

 
 

















 /*
 Container(
        width: double.infinity,
        height: double.infinity,
        margin: const EdgeInsets.all(5),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              /// CUSTOM
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: items.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, index) {
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                current = index;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.all(5),
                              width: MediaQuery.of(context).size.width * 0.47,
                              height: 45,
                              decoration: BoxDecoration(
                                color: current == index
                                    ? Colors.black
                                    : Colors.white,
                                borderRadius: current == index
                                    ? BorderRadius.circular(15)
                                    : BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  items[index],
                                  style: TextStyle(
                                      color: current == index
                                          ? Colors.white
                                          : Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
              ),

              /// MAIN BODY
              current == 0
                  ? SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: SizedBox(
                        height: 900,
                        child: GridView.builder(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 3 / 2,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 4,
                              mainAxisExtent: 370,
                            ),
                            padding: const EdgeInsets.all(10.0),
                            itemCount: productModel.length,
                            itemBuilder: (ctx, i) {
                              return GestureDetector(
                                onTap: () {
                                  navigateToDealScreen(
                                    productModel[i].name.toString(),
                                  );
                                },
                                child: SizedBox(
                                  height: 90,
                                  width: 90,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      CachedNetImage(
                                        imageUrl:
                                            productModel[i].image.toString(),
                                        height: 267,
                                        width:
                                            MediaQuery.of(context).size.width,
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      Text(
                                        productModel[i].name.toString(),
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 25,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                        productModel[i].description.toString(),
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                    )
                  : SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: SizedBox(
                        height: 900,
                        child: GridView.builder(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 3 / 2,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 4,
                              mainAxisExtent: 370,
                            ),
                            padding: const EdgeInsets.all(10.0),
                            itemCount: productModel.length,
                            itemBuilder: (ctx, i) {
                              return GestureDetector(
                                onTap: () {
                                  // Get.to(routes[i]);
                                },
                                child: SizedBox(
                                  height: 90,
                                  width: 90,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      CachedNetImage(
                                          imageUrl:
                                              productModel[i].image.toString(),
                                          height: 267,
                                          width: MediaQuery.of(context)
                                              .size
                                              .width),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      Text(
                                        productModel[i].name.toString(),
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 25,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                        productModel[i].description.toString(),
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                    ),
            ],
          ),
        ),
      ),
  */

/*


Padding(
        padding: const EdgeInsets.only(left: 2, right: 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 40,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 2,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ;
                  }),
            ),
            Expanded(
              child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 4,
                    mainAxisExtent: 370,
                  ),
                  padding: const EdgeInsets.all(10.0),
                  itemCount: productModel.length,
                  itemBuilder: (ctx, i) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(routes[i]);
                      },
                      child: SizedBox(
                        height: 90,
                        width: 90,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CachedNetImage(
                                imageUrl: productModel[i].image.toString(),
                                height: 267,
                                width: MediaQuery.of(context).size.width),
                            const SizedBox(
                              height: 12,
                            ),
                            Text(
                              productModel[i].name.toString(),
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                              productModel[i].description.toString(),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
*/

// enum = auth auth  = sign up  =
/*
 Expanded(
              child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 4,
                    mainAxisExtent: 370,
                  ),
                  padding: const EdgeInsets.all(10.0),
                  itemCount: productModel.length,
                  itemBuilder: (ctx, i) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(const ProductDetails());
                      },
                      child: SizedBox(
                        height: 90,
                        width: 90,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CachedNetImage(
                                imageUrl: productModel[i].image.toString(),
                                height: 267,
                                width: MediaQuery.of(context).size.width),
                            const SizedBox(
                              height: 12,
                            ),
                            Text(
                              productModel[i].name.toString(),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                              productModel[i].description.toString(),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
*/
