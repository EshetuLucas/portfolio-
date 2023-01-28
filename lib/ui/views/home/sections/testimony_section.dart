import 'package:flutter/material.dart';
import 'package:portfolio/ui/common/app_colors.dart';
import 'package:portfolio/ui/common/app_text_styles.dart';
import 'package:portfolio/ui/common/ui_helpers.dart';
import 'package:portfolio/ui/widgets/image_builder.dart';

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
        verticalSpaceLarge,
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: screenWidth(context) < 740
              ? Column(
                  children: const [
                    _DaneTestimony(),
                    verticalSpaceMedium,
                    _IssacTestimony(),
                  ],
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Expanded(
                      child: _DaneTestimony(),
                    ),
                    horizontalSpaceLarge,
                    Expanded(
                      child: _IssacTestimony(),
                    )
                  ],
                ),
        )
      ],
    );
  }
}

class _IssacTestimony extends StatelessWidget {
  const _IssacTestimony();

  @override
  Widget build(BuildContext context) {
    return const TestimonyWidget(
      name: 'Isaac Adariku',
      position: 'Platform Engineer\nReflection.app',
      imagePath: 'assets/images/isaac.jpeg',
      testimony:
          "I have had the pleasure of working with Eshetu as a Software Engineer using Flutter for the past few years and can confidently say that he is a valuable asset to any team. Not only is he a skilled engineer, but he is also a strong communicator, a true friend, and a great colleague."
          "Eshetu has the rare ability to turn complex ideas into easily understandable explanations, which has greatly benefited our team and our projects. He is also a true team player, always willing to lend a helping hand and go above and beyond to ensure the success of our projects."
          "In addition to his technical skills, Eshetu has a strong work ethic and is always striving to improve. I have no doubt that he will continue to excel in his career and be a valuable asset to any team he joins."
          "I highly recommend Eshetu for any opportunity and am confident that he will be a 10x Flutter Engineer wherever he goes.",
    );
  }
}

class _DaneTestimony extends StatelessWidget {
  const _DaneTestimony();

  @override
  Widget build(BuildContext context) {
    return const TestimonyWidget(
      name: 'Dane Mackier',
      position:
          'Flutter,Dart Google Developer Expert (GDE)\nCreator of FilledStacksCreator',
      imagePath: 'assets/images/dane.jpeg',
      testimony:
          "Eshetu has worked directly with me as well as other FilledStacks team members that has over a decade of experience in building software. The discussions, ideas and processes we exposed him to paid off quickly when we could start relying on him to complete certain tasks at hand. Not a lot of Junior developers are exposed to kind and thoughtful leadership due to the pressures felt in certain types of companies, but I am very happy that I could work directly with Eshetu to see and monitor his growth. "
          "By the end of his time at FilledStacks we were not on daily checking terms anymore. He had grown into a space where he was managing his time and aiming to improve as a competent second in charge in one of our projects"
          "If you’re looking for a team member that you can rely on when things need to get done, someone that’s willing to try something even if it’s not “best practice” with a strong push to get work done then Eshetu will be a good fit for your team",
    );
  }
}

class TestimonyWidget extends StatelessWidget {
  const TestimonyWidget({
    super.key,
    required this.imagePath,
    required this.testimony,
    required this.position,
    required this.name,
  });

  final String imagePath;
  final String testimony;
  final String position;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth(context) / 40),
      child: Column(
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxHeight: 150,
            ),
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: ImageBuilder(imagePath: imagePath),
            ),
          ),
          verticalSpaceSmall,
          Text(
            name,
            style: ktsBoldTextStyle.copyWith(
              color: kcPrimaryColor,
              fontSize: getResponsiveFontSize(
                context,
                minFont: 13,
                maxFont: 18,
              ),
            ),
          ),
          verticalSpaceTiny,
          Text(
            position,
            style: ktsBoldTextStyle.copyWith(
              color: kcPrimaryColor.withOpacity(0.8),
            ),
          ),
          verticalSpaceSmall,
          Text(
            testimony,
            style: ktsSmallDarkTextStyle.copyWith(
              color: kcLightBlue,
              fontSize: getResponsiveFontSize(
                context,
                minFont: 11,
                maxFont: 13,
              ),
            ),
          )
        ],
      ),
    );
  }
}
