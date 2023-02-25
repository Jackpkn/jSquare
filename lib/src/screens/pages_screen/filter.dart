import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jsquare/src/models/product_models.dart';
import 'package:jsquare/src/widgets/container.dart';

import '../../controller/icon_visible_controler.dart';
import '../../widgets/rating.dart';

class Filter extends StatefulWidget {
  const Filter({super.key});

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  IconController controller = Get.put(IconController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('jack'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                margin: const EdgeInsets.all(6),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16)),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GlobalContainer(
                        width: MediaQuery.of(context).size.width,
                        height: 40,
                        radius: 9,
                        borderWidth: 1,
                        color: Colors.black,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.filter_alt_rounded,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              'Select Filters',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      //! CUstomer Review
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          'Customer Review',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: List.generate(4, (index) {
                            return Row(
                              children: [
                                Checkbox(value: false, onChanged: (v) {}),
                                const RatingButton(rating: 5),
                              ],
                            );
                          }),
                        ),
                      ),

                      //! Brand
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          'Brand',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Column(
                        children: brand
                            .map(
                              (options) => CheckboxListTile(
                                tristate: true,
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                value: false,
                                title: Text(options.name.toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                                onChanged: (value) {
                                  options.isSelected = value!;
                                },
                              ),
                            )
                            .toList(),
                      ),
                      //! Price
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          'Price',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Column(
                        children: price
                            .map(
                              (options) => CheckboxListTile(
                                tristate: true,
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                value: false,
                                title: Text(options.name.toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                                onChanged: (value) {
                                  options.isSelected = value!;
                                },
                              ),
                            )
                            .toList(),
                      ),
                      //! Months Used
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          'Months used',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Column(
                        children: selectMonth
                            .map(
                              (options) => CheckboxListTile(
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                value: options.isSelected,
                                title: Text(
                                  options.name.toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    options.isSelected = value!;
                                  });
                                },
                              ),
                            )
                            .toList(),
                      ),
                      //! RESOLUTION
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          'Resolution',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Column(
                        children: resolution
                            .map(
                              (options) => CheckboxListTile(
                                tristate: true,
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                value: false,
                                title: Text(
                                  options.name.toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                onChanged: (value) {
                                  options.isSelected = value!;
                                },
                              ),
                            )
                            .toList(),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          'Display Size',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Column(
                        children: displaySize
                            .map(
                              (options) => CheckboxListTile(
                                tristate: true,
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                value: false,
                                title: Text(options.name.toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                                onChanged: (value) {
                                  options.isSelected = value!;
                                },
                              ),
                            )
                            .toList(),
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
  }
}
