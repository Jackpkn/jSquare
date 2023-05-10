import 'package:flutter/material.dart';
import 'package:jsquare/src/models/reviewmodel.dart';

import 'src/Features/Product_Details/widgets/productreview.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  int currentIndex = 0;

  // List list = [
  //   ReviewModel(
  //     rating: 'All',
  //     starColor: Colors.black,
  //   ),
  //   ReviewModel(
  //     rating: '5.0',
  //     starColor: Colors.green,
  //   ),
  //   ReviewModel(
  //     rating: '4.0',
  //     starColor: Colors.pink,
  //   ),
  //   ReviewModel(
  //       rating: '3.0',
  //       // starIcon: const Icon(Icons.star),
  //       starColor: Colors.yellow),
  //   ReviewModel(
  //     rating: '2.0',
  //     starColor: Colors.orange,
  //   ),
  //   ReviewModel(
  //     rating: '1.0',
  //     starColor: Colors.teal,
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              'Jack',
              style: TextStyle(color: Colors.amber),
            ),
            SizedBox(
              height: 50,
              child: ListView.builder(
                itemCount: reviewmodel.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.all(3),
                      height: 20,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.green,
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
                              reviewmodel[index].rating.toString(),
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
                              color: reviewmodel[index].starColor,
                              weight: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            if (currentIndex == 0)
              ShowTi(
                listLength: 10,
              ),
            if (currentIndex == 1) const Text('first line second'),
            if (currentIndex == 2) const Text('first line third'),
            if (currentIndex == 3) const Text('first line fourth'),
            if (currentIndex == 4) const Text('first line fifth'),
            if (currentIndex == 5) const Text('first line sixth'),
          ],
        ),
      ),
    ));
  }
}
