import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CachedNetImage extends StatelessWidget {
  final String imageUrl;
  final double height;
  final double width;
  const CachedNetImage({
    super.key,
    required this.imageUrl,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width,
      height: height,
      // fit: BoxFit.cover,
      progressIndicatorBuilder: (context, url, downloadProgress) => Center(
          child: CircularProgressIndicator(value: downloadProgress.progress)),
      imageUrl: imageUrl,
      errorWidget: (context, url, error) => const Icon(
        Icons.error,
        size: 100,
        color: Colors.red,
      ),
    );
  }
}
