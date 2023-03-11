import 'package:flutter/material.dart';
import 'package:focused_menu_custom/modals.dart';
import 'package:jsquare/src/GlobalWidgets/container.dart';
import 'package:focused_menu_custom/focused_menu.dart';
import '../../GlobalWidgets/cached_network_image.dart';
import '../../GlobalWidgets/filter_page_appbar.dart';
import '../../GlobalWidgets/rating.dart';

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
                        FocusedMenuHolder(
                          menuWidth: 130,
                          // blurSize: 5.0,
                          menuItemExtent: 45,
                          menuBoxDecoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0))),
                          duration: const Duration(milliseconds: 100),
                          animateMenuItems: true,
                          blurBackgroundColor: Colors.black54,
                          openWithTap: true,
                          menuItems: [
                            FocusedMenuItem(
                                title: const Text("Open"),
                                trailingIcon: const Icon(Icons.open_in_new),
                                onPressed: () {}),
                            FocusedMenuItem(
                                title: const Text("Share"),
                                trailingIcon: const Icon(Icons.share),
                                onPressed: () {}),
                            FocusedMenuItem(
                                title: const Text("Favorite"),
                                trailingIcon: const Icon(Icons.favorite_border),
                                onPressed: () {}),
                            FocusedMenuItem(
                                title: const Text(
                                  "Delete",
                                  style: TextStyle(color: Colors.redAccent),
                                ),
                                trailingIcon: const Icon(
                                  Icons.delete,
                                  color: Colors.redAccent,
                                ),
                                onPressed: () {}),
                          ],
                          onPressed: () {},
                          child: Container(
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
                                  Icons.sort_sharp,
                                  size: 30,
                                  color: Colors.white,
                                ),
                                Text(
                                  'Sort by',
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ),
                        // GestureDetector(
                        //   onTap: () {
                        //     FocusedMenuHolder(
                        //       menuItems: [
                        //         FocusedMenuItem(
                        //             title: const Text("Open"),
                        //             trailingIcon: const Icon(Icons.open_in_new),
                        //             onPressed: () {}),
                        //         FocusedMenuItem(
                        //             title: const Text("Share"),
                        //             trailingIcon: const Icon(Icons.share),
                        //             onPressed: () {}),
                        //         FocusedMenuItem(
                        //             title: const Text("Favorite"),
                        //             trailingIcon:
                        //                 const Icon(Icons.favorite_border),
                        //             onPressed: () {}),
                        //         FocusedMenuItem(
                        //             title: const Text(
                        //               "Delete",
                        //               style: TextStyle(color: Colors.redAccent),
                        //             ),
                        //             trailingIcon: const Icon(
                        //               Icons.delete,
                        //               color: Colors.redAccent,
                        //             ),
                        //             onPressed: () {}),
                        //       ],
                        //       onPressed: () {},
                        //       child: const Text('jack'),
                        //     );
                        //   },
                        //   child: Container(
                        //     width: MediaQuery.of(context).size.width * 0.47,
                        //     height: 35,
                        //     decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(10),
                        //       color: Colors.black,
                        //     ),
                        //     child: const Row(
                        //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //       children: [
                        //         Icon(
                        //           Icons.line_axis,
                        //           color: Colors.orange,
                        //         ),
                        //         Text(
                        //           'Sort by',
                        //           style: TextStyle(
                        //             fontSize: 20,
                        //             color: Colors.white,
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
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
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      child: ListView.builder(
                          itemCount: 30,
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(9),
                              child: SizedBox(
                                height: 210,
                                child: Row(
                                  children: [
                                    CachedNetImage(
                                      imageUrl:
                                          'https://th.bing.com/th/id/R.63efc9695a5c394cd3dbae2348fc2422?rik=6KmK7sTmQcaLBw&riu=http%3a%2f%2fproducts.geappliances.com%2fMarketingObjectRetrieval%2fDispatcher%3fRequestType%3dImage%26Name%3d044203.jpg%26Variant%3dViewLarger&ehk=ki56ik%2bqxPZruK8j5WZKUvchu1yzWO%2f2NBUqWyopK3g%3d&risl=&pid=ImgRaw&r=0&sres=1&sresct=1',
                                      height: 201,
                                      width: MediaQuery.of(context).size.width *
                                          0.46,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 4),
                                      child: SizedBox(
                                        height: 210,
                                        width:
                                            MediaQuery.of(context).size.width *
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
                                                    style:
                                                        TextStyle(fontSize: 16),
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
                                                  style:
                                                      TextStyle(fontSize: 18),
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
              ))),
    );
  }
}
