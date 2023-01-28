import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/ui/common/app_colors.dart';
import 'package:portfolio/ui/common/app_text_styles.dart';
import 'package:portfolio/ui/common/ui_helpers.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        color: kcSecondaryColor,
        child: Row(
          children: [
            Column(
              children: [
                Text(
                  "Let's Discuss your Project",
                  style: ktsLargDarkTextStyle.copyWith(
                    color: kcPrimaryColor,
                    fontSize: getResponsiveFontSize(
                      context,
                      minFont: 20,
                      maxFont: 40,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          FontAwesomeIcons.linkedin,
                        ),
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          FontAwesomeIcons.git,
                        ),
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ));
  }
}
