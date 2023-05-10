// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jsquare/src/GlobalWidgets/container.dart';
import 'package:jsquare/src/models/category_model.dart';
import 'package:jsquare/src/providers/user_provider.dart';
import 'package:provider/provider.dart';

import '../../../GlobalWidgets/cached_network_image.dart';
import '../services/admin_category_service.dart';

class GetCategoryPro extends StatefulWidget {
  const GetCategoryPro({super.key});

  @override
  State<GetCategoryPro> createState() => _GetCategoryProState();
}

class _GetCategoryProState extends State<GetCategoryPro> {
  UserProvider userProvider = Get.put(UserProvider());

  List<CategoryModel>? categoryList;
  @override
  void initState() {
    // fetchCategoryProduct(context);
    super.initState();
  }

  // fetchCategoryProduct(BuildContext context) async {
  //   final adminProvider = context.read<AdminCategoryProvider>();
  //   categoryList = await adminProvider.getCategoryProduct();
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    final adminProvider = context.read<AdminCategoryProvider>();
    return Scaffold(
      appBar: AppBar(),
      body: categoryList == null
          ? const CircularProgressIndicator(
              color: Colors.amber,
            )
          : Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                 
                padding: const EdgeInsets.all(12.0),
                child: GridView.builder(
                  itemCount: categoryList!.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 4.0,
                    mainAxisExtent: 215,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    final data = categoryList![index];
                    return GestureDetector(
                      onTap: () {
                        // navigate to details page
                      },
                      child: GlobalContainer(
                        radius: 10,
                        height: 40,
                        width: 0,
                        borderWidth: 0,
                        color: Colors.amber,
                        child: Column(
                          children: [
                            Container(
                              height: 158,
                              width: MediaQuery.of(context).size.width,
                              decoration: const BoxDecoration(
                                color: Colors.green,
                              ),
                              child: Stack(
                                children: [
                                  CachedNetImage(
                                      imageUrl: data.image![0],
                                      height: 267,
                                      width: MediaQuery.of(context).size.width),
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: IconButton(
                                      onPressed: () {
                                        adminProvider.deleteCategoryProduct(
                                          categoryModel: data,
                                        );
                                      },
                                      icon: const Icon(
                                        Icons.delete,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 0,
                                    top: 0,
                                    child: IconButton(
                                      onPressed: () {
                                        // Get to update
                                      },
                                      icon: const Icon(
                                        Icons.upload,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                Text(
                                  data.categoryName.toString(),
                                ),
                                Text(
                                  'Starting price ${data.strPrice}',
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
    );
  }
}
