 
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class ShowTi extends StatelessWidget {
  int? listLength;
  ShowTi({super.key, this.listLength});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
              itemCount: listLength,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 0),
                              child: Text(
                                'fiveRateList[index]',
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
                                color: Colors.white,
                                weight: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Text(
                        'jack nd',
                        style: TextStyle(color: Colors.green),
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
    );
  }
}
