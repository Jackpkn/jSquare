// ignore_for_file: prefer_collection_literals, must_be_immutable

import 'package:flutter/material.dart';

import '../models/productmodels.dart';
import '../models/reviewmodel.dart';
import 'home_appbar.dart';

class AllReviews extends StatefulWidget {
  Product data;
  AllReviews({super.key, required this.data});

  @override
  State<AllReviews> createState() => _AllReviewsState();
}

class _AllReviewsState extends State<AllReviews>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  int current = 0;
  List fiveRateList = [];
  double fiveRating = 0;
  int fourRating = 0;
  List fourRateList = [];
  int threeRating = 0;
  List threeRateList = [];
  int twoRating = 0;
  List twoRateList = [];
  int oneRating = 0;
  List oneRateList = [];
  @override
  void initState() {
    _tabController = TabController(length: 6, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
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

    // List allList = [fiveRateList, threeRateList, twoRateList]
    //     .expand((element) => element)
    //     .toList();
    // debugPrint(allList as String?);
    return Scaffold(
      appBar: appbar(context: context),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TabBar(
              indicatorColor: Colors.transparent,
              labelColor: Colors.pink,
              unselectedLabelColor: Colors.grey,
              labelStyle: const TextStyle(
                  // fontSize: 16,
                  ),
              unselectedLabelStyle: const TextStyle(
                  // fontSize: 16,
                  ),
              isScrollable: true,
              indicatorPadding: const EdgeInsets.all(12),
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
              controller: _tabController,
              // physics: const NeverScrollableScrollPhysics(),
              tabs: [
                ReviewModel(
                  rating: 'All',
                  starColor: Colors.black,
                ),
                ReviewModel(
                  rating: '5.0',
                  starColor: Colors.green,
                ),
                ReviewModel(
                  rating: '4.0',
                  starColor: Colors.pink,
                ),
                ReviewModel(
                    rating: '3.0',
                    // starIcon: const Icon(Icons.star),
                    starColor: Colors.yellow),
                ReviewModel(
                  rating: '2.0',
                  starColor: Colors.orange,
                ),
                ReviewModel(
                  rating: '1.0',
                  starColor: Colors.teal,
                ),
              ]
                  .map(
                    (index) => Container(
                      margin: const EdgeInsets.all(3),
                      height: 20,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: Colors.black,
                            width: 1.0,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 0),
                            child: Text(
                              index.rating.toString(),
                              style: const TextStyle(
                                  fontSize: 9.8, fontWeight: FontWeight.w600),
                            ),
                          ),
                          const SizedBox(
                            width: 1,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 1.4),
                            child: Icon(
                              Icons.star,
                              size: 16,
                              color: index.starColor,
                              weight: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // first tab bar view widget
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Reviews(195)',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 17,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ListView.builder(
                            itemCount: fiveRateList.length,
                            // itemCount: j.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(6),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.all(3),
                                      height: 20,
                                      width: 45,
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                        border: Border.all(
                                            color: Colors.black,
                                            width: 1.0,
                                            style: BorderStyle.solid),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      alignment: Alignment.center,
                                      child: const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(bottom: 0),
                                            child: Text(
                                              '5.0',
                                              style: TextStyle(
                                                  fontSize: 9.8,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 1,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 1.4),
                                            child: Icon(
                                              Icons.star,
                                              size: 16,
                                              color: Colors.white,
                                              weight: 20,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      fiveRateList[index].toString(),
                                      style:
                                          const TextStyle(color: Colors.green),
                                    ),
                                    const Text(
                                      'What the product',
                                      style: TextStyle(color: Colors.green),
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),

                  // second tab bar view widget
                  const Center(
                    child: Text(
                      'Buy Now',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const Center(
                    child: Text(
                      'Buy Now',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const Center(
                    child: Text(
                      'Buy Now',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const Center(
                    child: Text(
                      'Buy Now',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const Center(
                    child: Text(
                      'Buy Now',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//I don't know much as i used to have a 17 inch and 60hz monitor but after buying this it fee like i have the smoothest PC in the world (
//i know there are better monitors and stuff but pretty good good for a gamer) but the'
class ListReview extends StatelessWidget {
  const ListReview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ReviewModel(
          rating: 'All',
          starColor: Colors.black,
        ),
        ReviewModel(
          rating: '5.0',
          starColor: Colors.green,
        ),
        ReviewModel(
          rating: '4.0',
          starColor: Colors.pink,
        ),
        ReviewModel(
            rating: '3.0',
            // starIcon: const Icon(Icons.star),
            starColor: Colors.yellow),
        ReviewModel(
          rating: '2.0',
          starColor: Colors.orange,
        ),
        ReviewModel(
          rating: '1.0',
          starColor: Colors.teal,
        ),
      ]
          .map(
            (index) => Container(
              margin: const EdgeInsets.all(3),
              height: 20,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.black,
                  width: 1.0,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(4),
              ),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 0),
                    child: Text(
                      index.rating.toString(),
                      style: const TextStyle(
                        fontSize: 9.8,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 1.4),
                    child: Icon(
                      Icons.star,
                      size: 16,
                      color: index.starColor,
                      weight: 20,
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}

// Container(
//           height: 20,
//           width: 40,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             border: Border.all(
//                 color: Colors.black, width: 1.0, style: BorderStyle.solid),
//             borderRadius: BorderRadius.circular(4),
//           ),
//           alignment: Alignment.center,
//           child: const Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Padding(
//                 padding: EdgeInsets.only(bottom: 0),
//                 child: Text(
//                   '5.0',
//                   style: TextStyle(fontSize: 9.8, fontWeight: FontWeight.w600),
//                 ),
//               ),
//               SizedBox(
//                 width: 1,
//               ),
//               Padding(
//                 padding: EdgeInsets.only(top: 1.4),
//                 child: Icon(
//                   Icons.star,
//                   size: 16,
//                   color: Colors.green,
//                   weight: 20,
//                 ),
//               ),
//             ],
//           ),
//         ),

/*
  Container(
                  width: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                  child: const Tab(
                    height: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 0),
                          child: Text(
                            'All',
                            style: TextStyle(
                                fontSize: 9.8, fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(
                          width: 1,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 1.4),
                          child: Icon(
                            Icons.star,
                            size: 16,
                            color: Colors.pink,
                            weight: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 70,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                  child: const Tab(
                    height: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 0),
                          child: Text(
                            '5.0',
                            style: TextStyle(
                                fontSize: 9.8, fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(
                          width: 1,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 1.4),
                          child: Icon(
                            Icons.star,
                            size: 16,
                            color: Colors.pink,
                            weight: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // second tab [you can add an icon using the icon property]
                const Tab(
                  height: 20,
                  // text: 'Buy Now',
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 0),
                        child: Text(
                          '4.0',
                          style: TextStyle(
                              fontSize: 9.8, fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(
                        width: 1,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 1.4),
                        child: Icon(
                          Icons.star,
                          size: 16,
                          color: Colors.pink,
                          weight: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                const Tab(
                  height: 20,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 0),
                        child: Text(
                          '3.0',
                          style: TextStyle(
                              fontSize: 9.8, fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(
                        width: 1,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 1.4),
                        child: Icon(
                          Icons.star,
                          size: 16,
                          color: Colors.pink,
                          weight: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                const Tab(
                  height: 20,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 0),
                        child: Text(
                          '2.0',
                          style: TextStyle(
                              fontSize: 9.8, fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(
                        width: 1,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 1.4),
                        child: Icon(
                          Icons.star,
                          size: 16,
                          color: Colors.pink,
                          weight: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                const Tab(
                  height: 20,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 0),
                        child: Text(
                          '1.0',
                          style: TextStyle(
                              fontSize: 9.8, fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(
                        width: 1,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 1.4),
                        child: Icon(
                          Icons.star,
                          size: 16,
                          color: Colors.pink,
                          weight: 20,
                        ),
                      ),
                    ],
                  ),
                ),
*/