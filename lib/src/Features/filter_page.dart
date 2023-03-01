import 'package:flutter/material.dart';
import 'package:jsquare/src/GlobalWidgets/container.dart';

import '../GlobalWidgets/cached_network_image.dart';
import '../GlobalWidgets/filter_page_appbar.dart';
import '../GlobalWidgets/rating.dart';

class FilterPage extends StatelessWidget {
  const FilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: filerAppbar(),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.47,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black,
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.line_axis,
                            color: Colors.orange,
                          ),
                          Text(
                            'Sort by',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.47,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black,
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.line_axis,
                            color: Colors.orange,
                          ),
                          Text(
                            'Filter',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  child: ListView.builder(
                      itemCount: 30,
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(9),
                          child: SizedBox(
                            height: 201,
                            child: Row(
                              children: [
                                CachedNetImage(
                                  imageUrl:
                                      'https://th.bing.com/th/id/R.63efc9695a5c394cd3dbae2348fc2422?rik=6KmK7sTmQcaLBw&riu=http%3a%2f%2fproducts.geappliances.com%2fMarketingObjectRetrieval%2fDispatcher%3fRequestType%3dImage%26Name%3d044203.jpg%26Variant%3dViewLarger&ehk=ki56ik%2bqxPZruK8j5WZKUvchu1yzWO%2f2NBUqWyopK3g%3d&risl=&pid=ImgRaw&r=0&sres=1&sresct=1',
                                  height: 201,
                                  width:
                                      MediaQuery.of(context).size.width * 0.46,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  child: SizedBox(
                                    height: 200,
                                    width: MediaQuery.of(context).size.width *
                                        0.46,
                                    child: const Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Samsung 55 Inches 4K Neo Series Ultra HD Smart LED TV',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          SizedBox(
                                            height: 6,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                '5.0',
                                                style: TextStyle(fontSize: 16),
                                              ),
                                              SizedBox(
                                                width: 2,
                                              ),
                                              RatingButton(
                                                rating: 5,
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 6,
                                          ),
                                          Text(
                                            '₹500 Per Month',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          SizedBox(
                                            height: 6,
                                          ),
                                          GlobalContainer(
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
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
