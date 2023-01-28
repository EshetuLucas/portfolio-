import 'package:flutter/material.dart';
import 'package:portfolio/ui/widgets/image_builder.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    required this.fit,
    Key? key,
  }) : super(key: key);

  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return ImageBuilder(
      imagePath: 'assets/images/placeholder.png',
      fit: fit,
    );
  }
}
