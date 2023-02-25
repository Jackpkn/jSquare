import 'package:flutter/material.dart';
import 'package:jsquare/src/models/cart_model.dart';
import 'package:jsquare/src/models/product_models.dart';
import 'package:jsquare/src/widgets/container.dart';
import 'package:jsquare/src/widgets/rating.dart';

import '../../widgets/cached_network_image.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int currentIndex = 0;

  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 229, 223, 223),
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(
              right: 4,
              top: 3,
              left: 4,
            ),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.menu),
                        iconSize: 34,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.search),
                        iconSize: 34,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        iconSize: 34,
                        icon: const Icon(Icons.shopping_cart),
                      ),
                      const CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.black,
                        child: Text('J'),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
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
                      itemCount: productModel.length,
                      onPageChanged: (value) {
                        setState(() {
                          currentIndex = value;
                        });
                      },
                      scrollDirection: Axis.horizontal,
                      controller: controller,
                      itemBuilder: (context, index) {
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
                                  imageUrl:
                                      productModel[index].image.toString(),
                                ),
                              ),
                              Positioned(
                                right: 5,
                                top: 6,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: const GlobalContainer(
                                    height: 32,
                                    width: 32,
                                    radius: 50,
                                    borderWidth: 1.3,
                                    child: Icon(
                                      Icons.heart_broken_sharp,
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
                    for (int i = 0; i < productModel.length; i++)
                      buildIndicator(currentIndex == i)
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    left: 16,
                    right: 16,
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Samsung 55 Inches 4K Neo Series Ultra HD Smart LED TV',
                      style: TextStyle(
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
                  children: const [
                    Text('4.0'),
                    SizedBox(
                      width: 4,
                    ),
                    RatingButton(rating: 5,),
                    SizedBox(
                      width: 4,
                    ),
                    Text('(1,499)'),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                const Align(
                  child: Text(
                    '₹ 500 per month',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w400,
                      fontSize: 30,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 9,
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
                        'Add to Cart',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
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
                Container(
                  height: 200,
                  margin: const EdgeInsets.all(9),
                  child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 0.3,
                            ),
                          ),
                          height: 40,
                          child: Row(
                            children: [
                              Container(
                                height: 40,
                                color: const Color.fromARGB(255, 206, 203, 203),
                                width: MediaQuery.of(context).size.width * 0.36,
                                child: const Align(
                                    alignment: Alignment.center,
                                    child: Text('Brand')),
                              ),
                              Expanded(
                                child: Container(
                                  // width: MediaQuery.of(context).size.width * 0.50,
                                  color: Colors.white,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      productModel[index].name.toString(),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Ratings & Reviews',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      GlobalContainer(
                        height: 30,
                        width: 120,
                        borderWidth: 1.0,
                        radius: 10,
                        child: Text(
                          'Rate product',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 90,
                  child: ListView.builder(
                      itemCount: 6,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 4),
                          child: CachedNetImage(
                            height: 60,
                            width: 60,
                            imageUrl: cartItems[index].image.toString(),
                          ),
                        );
                      }),
                ),
                Row(
                  children: [
                    Container(
                      decoration: const BoxDecoration(color: Colors.green),
                      height: 19,
                      width: 35,
                      child: const Text('5★'),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Text(
                      'Highly recommended',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 7,
                ),
                const Text(
                  'The English Wikipedia is, with the Simple English Wikipedia, one of two English-language editions of Wikipedia, an online encyclopedia. It was founded on January 15, 2001, as Wikipedia first edition, and, as of February 15, 2023, has the most articles of any edition, at 6,618,258. As of February 2023, 10.9% of articles in all Wikipedias belong to the English-language edition; this share is d',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(
                  height: 9,
                ),
                const Text(
                  'Related Products',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 19,
                  ),
                ),
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