import 'package:flutter/material.dart';

class RecommendedPage extends StatelessWidget {
  static const String routeName = 'recommended-page';
  const RecommendedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recommended'),
      ),
      body: const Column(
        children: [],
      ),
    );
  }
}
