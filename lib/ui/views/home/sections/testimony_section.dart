import 'package:flutter/material.dart';
import 'package:portfolio/ui/common/app_colors.dart';
import 'package:portfolio/ui/common/app_text_styles.dart';
import 'package:portfolio/ui/common/ui_helpers.dart';

class TestimonySection extends StatelessWidget {
  const TestimonySection({
    super.key,
    required this.serviceKey,
  });

  final GlobalKey<State<StatefulWidget>> serviceKey;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          key: serviceKey,
          'Testimonials',
          style: ktsLargDarkTextStyle.copyWith(
            color: kcPrimaryColor,
            fontSize: getResponsiveFontSize(
              context,
              minFont: 20,
              maxFont: 30,
            ),
          ),
        ),
        Text(
          'What they say about me',
          style: ktsLargDarkTextStyle.copyWith(
            color: kcPrimaryColor,
            fontSize: getResponsiveFontSize(
              context,
              minFont: 20,
              maxFont: 30,
            ),
          ),
        ),
      ],
    );
  }
}
