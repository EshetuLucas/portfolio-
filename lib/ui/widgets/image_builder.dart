import 'package:flutter/material.dart';

class ImageBuilder extends StatelessWidget {
  const ImageBuilder({
    Key? key,
    required this.imagePath,
    this.fit = BoxFit.contain,
  }) : super(key: key);
  final String imagePath;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      fit: fit,
    );
  }
}
