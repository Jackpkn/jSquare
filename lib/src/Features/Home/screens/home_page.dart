import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jsquare/src/Features/Home/controllers/home_controller.dart';
import 'package:jsquare/src/GlobalWidgets/home_appbar.dart';

import '../../../GlobalWidgets/cached_network_image.dart';
import '../../../models/category_model.dart';
import '../../category/screens/category_product.dart';
import '../services/home_service_provider.dart';
import 'drawer_screen.dart';

class IntroPage extends StatefulWidget {
  static const String routeName = 'home-screen';
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage>
    with SingleTickerProviderStateMixin {
  void navigateToDealScreen(String category) {
    Get.toNamed(CategoryProduct.routeName, arguments: category);
  }

  final controller = Get.put(HomeController());
  List<CategoryModel>? categoryList;
  // TabController? _tabController;
  @override
  void initState() {
    super.initState();
    // fetchCategoryProducts();
    categoryProvider.fetchApplianceProducts(context: context);
    categoryProvider.fetchFurnitureProducts(context: context);
    // _tabController = TabController(length: 6, vsync: this);
  }

  // fetchCategoryProducts() async {
  //   final data = Get.put(CategoryProvider());
  //   // categoryList = await data.getCategoryProduct();
  //   setState(
  //     () {},
  //   );
  // }

  List productType = [
    'Furniture',
    'Appliances',
  ];
  // UserProvider userProvider = Get.put(UserProvider());
  HomeController homeController = Get.put(HomeController());

  final categoryProvider = Get.put(CategoryProvider());
  // List<CategoryModel> appliancesList = categoryProvider.appliancesList;
  int currentIndex = 0;
  int _selectedContainerIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 29, 20, 20),
      drawer: HomeDrawer(),
      extendBody: true,
      appBar: appbar(context: context),
      body: RefreshIndicator(
        onRefresh: () async {
          categoryProvider.fetchApplianceProducts(context: context);
          categoryProvider.fetchFurnitureProducts(context: context);
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 9, bottom: 20, right: 5, left: 5),
          child: Column(
            children: [
              SizedBox(
                height: 30,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedContainerIndex = index;
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.48,
                          decoration: BoxDecoration(
                            color: _selectedContainerIndex == index
                                ? Colors.black
                                : Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            " ${productType[index].toString()}",
                            style: TextStyle(
                              color: _selectedContainerIndex == index
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              if (_selectedContainerIndex == 0)
                Obx(() => categoryProvider.isLoading.value
                    ? (const Center(
                        child: CircularProgressIndicator(),
                      ))
                    : Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent: 372,
                          ),
                          itemCount: categoryProvider.appliancesList.length,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            // final   data: categoryProvider.appliancesList[index],
                            // debugPrint(
                            //     categoryProvider.appliancesList.length.toString());
                            final data = categoryProvider.appliancesList[index];
                            debugPrint(data.categoryName);
                            return GestureDetector(
                              onTap: () {
                                navigateToDealScreen(
                                  data.categoryName.toString(),
                                );
                              },
                              child: Card(
                                color: const Color.fromARGB(255, 44, 32, 32),
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 4, right: 2, bottom: 3, top: 4),
                                  padding: const EdgeInsets.all(8),
                                  // height: 500,
                                  // color: Colors.green,
                                  child: Column(
                                    children: [
                                      CachedNetImage(
                                        imageUrl: data.image.toString(),
                                        height: 220,
                                        width:
                                            MediaQuery.of(context).size.width,
                                      ),
                                      Text(
                                      data.categoryName.toString(),
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          color: Color.fromARGB(
                                              255, 240, 238, 238),
                                          fontSize: 25,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        "starting Price ₹ ${data.strPrice.toString()}",
                                        style: const TextStyle(
                                          color: Color.fromARGB(
                                              255, 240, 238, 238),
                                          fontSize: 20,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      )),
              if (_selectedContainerIndex == 1)
                Obx(
                  () => categoryProvider.isLoading.value
                      ? (const Center(
                          child: CircularProgressIndicator(),
                        ))
                      : Expanded(
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ),
                            itemCount: categoryProvider.appliancesList.length,
                            itemBuilder: (context, index) {
                              // debugPrint(categoryProvider.appliancesList.length
                              //     .toString());
                              return Container(
                                margin: const EdgeInsets.all(8),
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 241, 19, 19),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  categoryProvider
                                      .appliancesList[index].categoryName
                                      .toString(),
                                  style: const TextStyle(color: Colors.green),
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
    );
  }
}

 
 










/*
 Obx(
            () => Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        homeController.tabStatus.toggle();
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
                        homeController.tabStatus.toggle();
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
                                  ? Colors.black
                                  : Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                homeController.tabStatus.value
                    ? HomeWidget(
                        productList: productModel.length,
                        imageUrl: productModel[index + 1].name.toString(),
                        productName: 'productName',
                        description: 'description',
                      )
                    : HomeWidget(
                        productList: furniture.length,
                        imageUrl: furniture[index + 1].name.toString(),
                        productName: 'productName',
                        description: 'description',
                      )
              ],
            ),
          ),
*/






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
