import 'package:flutter/material.dart';
import 'package:portfolio/ui/widgets/image_builder.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    required this.fit,
    Key? key,
    this.imagePath = 'assets/images/placeholder.png',
  }) : super(key: key);

  final BoxFit fit;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return ImageBuilder(
      imagePath: imagePath,
      fit: fit,
    );
  }
}
