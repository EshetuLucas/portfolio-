import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/ui/common/app_colors.dart';
import 'package:portfolio/ui/common/app_text_styles.dart';
import 'package:portfolio/ui/common/ui_helpers.dart';
import 'package:portfolio/ui/views/home/home_viewmodel.dart';
import 'package:portfolio/ui/widgets/image_builder.dart';
import 'package:stacked/stacked.dart';

class FooterSection extends ViewModelWidget<HomeViewModel> {
  const FooterSection({super.key, required this.contactKey});

  final GlobalKey<State<StatefulWidget>> contactKey;

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Padding(
      padding: appSymmetricEdgePadding(context),
      child: Column(
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Text(
                            key: contactKey,
                            "Let's talk, and make something great",
                            style: ktsLargDarkTextStyle.copyWith(
                              color: kcPrimaryColor,
                              fontSize: getResponsiveFontSize(
                                context,
                                minFont: 13,
                                maxFont: 30,
                              ),
                            ),
                          ),
                          verticalSpaceMedium,
                          Wrap(
                            spacing: screenWidth(context) / 40,
                            children: [
                              _Contact(
                                onTap: () => viewModel.onLinkTap(
                                    'https://www.linkedin.com/in/eshetu-lukas-83a677192/'),
                                iconData: FontAwesomeIcons.linkedin,
                                color: kcBlue,
                              ),
                              _Contact(
                                onTap: () => viewModel.onLinkTap(
                                    'https://github.com/EshetuLucas'),
                                iconData: FontAwesomeIcons.github,
                                color: kcDarkGreyColor,
                              ),
                              _Contact(
                                onTap: () => viewModel.sendEmail(),
                                iconData: Icons.email,
                                color: kcWhite,
                              ),
                              _Contact(
                                onTap: () => viewModel
                                    .onLinkTap('https://wa.me/+251916740322'),
                                iconData: FontAwesomeIcons.whatsapp,
                                color: kcLDeepGreen,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const Expanded(
                      child: ImageBuilder(
                        imagePath: 'assets/images/fo.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(
            color: kcPrimaryColor,
            thickness: .2,
          ),
          Text(
            '@ 2023 Eshetu Lukas',
            style: ktsSmallDarkTextStyle.copyWith(
              fontSize: getResponsiveFontSize(context,
                  minFont: 12, maxFont: 14, dividedBy: 65),
            ),
          )
        ],
      ),
    );
  }
}

class _Contact extends StatelessWidget {
  const _Contact(
      {required this.color, required this.iconData, required this.onTap});

  final IconData iconData;
  final Color color;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        shadowColor: kcPrimaryColor,
        elevation: 6,
        color: color,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: iconData == Icons.email
              ? SizedBox(
                  height: getResponsiveSize(context) / 30,
                  width: getResponsiveSize(context) / 30,
                  child: const ImageBuilder(
                    imagePath: 'assets/images/gmail.png',
                    fit: BoxFit.cover,
                  ),
                )
              : Icon(
                  iconData,
                  color: kcWhite,
                  size: getResponsiveSize(context) / 30,
                ),
        ),
      ),
    );
  }
}
