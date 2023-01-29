import 'package:flutter/material.dart';
import 'package:portfolio/ui/common/app_colors.dart';
import 'package:portfolio/ui/common/app_text_styles.dart';
import 'package:portfolio/ui/common/ui_helpers.dart';
import 'package:portfolio/ui/views/home/widgets/about_widget.dart';
import 'package:portfolio/ui/views/home/widgets/image_widget.dart';
import 'package:shape_of_view_null_safe/shape_of_view_null_safe.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({
    super.key,
    required this.homeKey,
    required this.arcShape,
    required this.screenwidth,
  });

  final GlobalKey<State<StatefulWidget>> homeKey;
  final double arcShape;
  final double screenwidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShapeOfView(
          key: homeKey,
          elevation: 0,
          shape: ArcShape(
            direction: ArcDirection.Outside,
            height: (screenwidth < 440
                ? 3
                : arcShape > 30
                    ? 30
                    : arcShape),
            position: ArcPosition.Bottom,
          ),
          child: ColoredBox(
            color: kcWhite,
            child: SizedBox(
              width: screenWidth(context),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  screenwidth < 440
                      ? Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    height: getResponsiveSize(context) / 3,
                                    child: Container(
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(2.0),
                                        child: ImageWidget(
                                          fit: BoxFit.contain,
                                          imagePath:
                                              'assets/images/placeholder1.png',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const Expanded(
                                  child: _NameWidget(),
                                )
                              ],
                            ),
                            _BioTextsWidget(
                              showAbout: false,
                              screenWidth: screenwidth,
                            ),
                          ],
                        )
                      : SizedBox(
                          width: getResponsiveSize(context) > 1300
                              ? 1300
                              : screenWidth(context),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                child: _BioWidget(
                                  showAbout: screenwidth >= 820,
                                  screenwidth: screenwidth,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  height: getResponsiveSize(context) / 2,
                                  width: getResponsiveSize(context) / 2.5,
                                  child: const ImageWidget(
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                ],
              ),
            ),
          ),
        ),
        if (screenwidth < 820)
          Padding(
            padding: appSymmetricEdgePadding(context),
            child: const About(),
          ),
      ],
    );
  }
}

class _NameWidget extends StatelessWidget {
  const _NameWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hello",
          style: ktsSmallDarkTextStyle.copyWith(
            fontSize: getResponsiveFontSize(
              context,
              minFont: 11,
              maxFont: 17,
            ),
          ),
        ),
        Text(
          'I\'M Eshetu Lukas',
          style: ktsLargDarkTextStyle.copyWith(
            color: kcPrimaryColor,
            fontSize: getResponsiveFontSize(
              context,
              minFont: 12,
              maxFont: 60,
            ),
          ),
        ),
        verticalSpaceTiny,
      ],
    );
  }
}

class _BioWidget extends StatelessWidget {
  const _BioWidget({
    required this.showAbout,
    required this.screenwidth,
    Key? key,
  }) : super(key: key);

  final bool showAbout;
  final double screenwidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: getResponsiveFontSize(
            context,
            minFont: 10,
            maxFont: 1000,
          ),
          height: screenHeight(context) / 3,
        ),
        Expanded(
          child: Container(
            alignment: Alignment.center,
            width: screenWidth(context) / 2,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: _BioTextsWidget(
                showAbout: showAbout,
                screenWidth: screenwidth,
              ),
            ),
          ),
        ),
        SizedBox(
          width: getResponsiveFontSize(
            context,
            minFont: 10,
            maxFont: 1000,
          ),
        ),
      ],
    );
  }
}

class _BioTextsWidget extends StatelessWidget {
  const _BioTextsWidget({
    required this.showAbout,
    required this.screenWidth,
    Key? key,
  }) : super(key: key);

  final bool showAbout;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: appSymmetricEdgePadding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (screenWidth > 440) const _NameWidget(),
          Text(
            "Software Developer | Specialized in Flutter, Firebase and Web | Building World-Class mobile apps",
            style: ktsSmallDarkTextStyle.copyWith(
              fontSize: getResponsiveFontSize(context,
                  minFont: 12, maxFont: 17, dividedBy: 45),
            ),
          ),
          if (showAbout) const About(),
        ],
      ),
    );
  }
}
