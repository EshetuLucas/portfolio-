import 'package:flutter/material.dart';
import 'package:portfolio/ui/common/app_colors.dart';
import 'package:portfolio/ui/common/app_text_styles.dart';
import 'package:portfolio/ui/common/ui_helpers.dart';

class About extends StatelessWidget {
  const About({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "I am an enthusiastic, knowledgable, self-motivated, and responsible Software engineer who specialised in flutter and strongly believes in teamwork and is adaptable to a new environment. I have 4+ years of extensive experience with Mobile App Development using Flutter."
      "I am a person who is always open to discussions, learning new things, and a quick learner as well. I am also able to work well under pressure and adhere to strict deadlines.",
      style: ktsSmallDarkTextStyle.copyWith(
        color: kcPrimaryColor.withOpacity(0.9),
        fontSize: getResponsiveFontSize(
          context,
          minFont: 13,
          maxFont: 14,
          dividedBy: 50,
        ),
      ),
    );
  }
}
