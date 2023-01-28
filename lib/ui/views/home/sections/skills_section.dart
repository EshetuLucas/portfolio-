import 'package:flutter/material.dart';
import 'package:portfolio/ui/common/app_colors.dart';
import 'package:portfolio/ui/common/app_text_styles.dart';
import 'package:portfolio/ui/common/ui_helpers.dart';
import 'package:portfolio/ui/widgets/image_builder.dart';

class SkillsAndExperienceSection extends StatelessWidget {
  const SkillsAndExperienceSection({
    super.key,
    required this.skillsKey,
    required this.screeenWidth,
  });

  final GlobalKey<State<StatefulWidget>> skillsKey;
  final double screeenWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpaceLarge,
        Text(
          key: skillsKey,
          'Skills & Experience',
          style: ktsLargDarkTextStyle.copyWith(
            color: kcPrimaryColor,
            fontSize: getResponsiveFontSize(
              context,
              minFont: 20,
              maxFont: 30,
            ),
          ),
        ),
        verticalSpaceMedium,
        if (screeenWidth < 840)
          Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              _SkillsWidget(),
              _ExperiencesWidget(),
            ],
          )
        else
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Expanded(child: _SkillsWidget()),
              Expanded(child: _ExperiencesWidget()),
            ],
          ),
      ],
    );
  }
}

class _SkillsWidget extends StatelessWidget {
  const _SkillsWidget({
    super.key,
  });
  static const List<String> skillsList = [
    'Flutter & Dart',
    'Android & iOS',
    'JavaScript',
    'GCP & Firebase',
    'GoLang',
    'C#,C&C++',
    'CSS',
    'HTML',
    'Java',
    'Python',
    'SQL',
    'TypeScript',
    'UI/UX',
    'PHP',
    'Adobe',
    'Blender',
    'Unit'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Skills',
          style: ktsLargDarkTextStyle.copyWith(
            color: kcDeepBlue,
            fontSize: getResponsiveFontSize(
              context,
              minFont: 20,
              maxFont: 25,
            ),
          ),
        ),
        verticalSpaceMedium,
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Wrap(
            spacing: 4,
            runSpacing: 4,
            children: [
              for (int i = 0; i < 17; i++)
                Column(
                  children: [
                    SizedBox(
                      height: 60,
                      width: 130,
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        elevation: 15,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        shadowColor: kcPrimaryColor,
                        child: ImageBuilder(
                          imagePath: 'assets/images/$i.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    verticalSpaceTiny,
                    Text(
                      skillsList[i],
                      style: ktsBoldTextStyle.copyWith(color: kcPrimaryColor),
                    )
                  ],
                )
            ],
          ),
        ),
      ],
    );
  }
}

class _ExperienceWidget extends StatelessWidget {
  const _ExperienceWidget({
    required this.companyName,
    required this.date,
    required this.description,
    required this.role,
  });
  final String date;
  final String companyName;
  final String role;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: appSymmetricEdgePadding(context),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (screenWidth(context) > 500) ...[
                Text(
                  date,
                  style: ktsSmallDarkTextStyle.copyWith(
                    color: kcPrimaryColor.withOpacity(0.8),
                    fontSize: getResponsiveFontSize(
                      context,
                      minFont: 11,
                      maxFont: 14,
                    ),
                  ),
                ),
                horizontalSpaceMedium,
              ],
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      companyName,
                      style: ktsLargDarkTextStyle.copyWith(
                        color: kcPrimaryColor,
                        fontSize: getResponsiveFontSize(
                          context,
                          minFont: 13,
                          maxFont: 20,
                        ),
                      ),
                    ),
                    Text(
                      role,
                      style: ktsLargDarkTextStyle.copyWith(
                        color: kcPrimaryColor.withOpacity(0.6),
                        fontSize: getResponsiveFontSize(
                          context,
                          minFont: 11,
                          maxFont: 14,
                        ),
                      ),
                    ),
                    verticalSpaceTiny,
                    if (screenWidth(context) <= 500) ...[
                      Text(
                        date,
                        style: ktsSmallDarkTextStyle.copyWith(
                          color: kcPrimaryColor.withOpacity(0.6),
                          fontSize: getResponsiveFontSize(
                            context,
                            minFont: 11,
                            maxFont: 14,
                          ),
                        ),
                      ),
                      verticalSpaceSmall,
                    ],
                    Text(
                      description,
                      style: ktsSmallDarkTextStyle.copyWith(
                        color: kcDeepBlue,
                        fontSize: getResponsiveFontSize(
                          context,
                          minFont: 11,
                          maxFont: 14,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class _ExperiencesWidget extends StatelessWidget {
  const _ExperiencesWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        children: [
          verticalSpaceLarge,
          Text(
            'Experience',
            style: ktsLargDarkTextStyle.copyWith(
              color: kcDeepBlue,
              fontSize: getResponsiveFontSize(
                context,
                minFont: 20,
                maxFont: 45,
              ),
            ),
          ),
          const _ExperienceWidget(
            date: '03/2020 to 11/2022',
            companyName: 'FilledStacks',
            role: 'Full stack Mobile Application Developer',
            description:
                "FilledStacks is a software development company that is founded by GDE(Flutter and dart Google developer expert) and the creator of stacked flutter state management architecture.The company built several world-class mobile apps using our own state management and internal mobile application testing software. Worked as Flutter Engineer, built two Live music apps from 1 code base and all-in-one five-a-side football management app ",
          ),
          verticalSpaceSmall,
          const _ExperienceWidget(
            date: '04/2018 to present',
            companyName: 'RoydTechs',
            role: 'Lead Mobile App developer',
            description:
                "Building world-class mobile Applications that solve local and international problems. One of the apps that we are building is called Amakari - which was founded in 2020 with the aim of serving our society in various ways. It was established by the collaboration of motivated entrepreneurs with experienced professionals.",
          ),
          verticalSpaceSmall,
          const _ExperienceWidget(
            date: '04/2018 to 11/2020',
            companyName: 'GoldG-Telecom',
            role: 'Mobile Application Developer',
            description:
                "As a Mobile app developer, with a wealth of experience in building high-quality mobile applications, I built over 20 mobile applications under my belt for this company, I have proven myself to be a reliable and skilled developer who consistently delivers excellent results for the company. My proficiency in Flutter, along with My strong attention to detail, has allowed me to create a wide range of applications that are both functional and visually appealing. My contributions to GoldG telecom have no doubt played a significant role in the company's success..",
          ),
          verticalSpaceSmall,
          const _ExperienceWidget(
            date: '04/2019 to 09/2019',
            companyName: 'MINT (Minster of innovation and technology)',
            role: 'Mobile Application Developer',
            description:
                "Built a mobile application for fighting covid19 pandemic with many features included in it. Like location-based contact tracing, news, current updates on COVID-19, voluntarism service, donation service, and many other features. Minister of Innovation and Technology and UNDP are responsible for this app.",
          ),
          verticalSpaceSmall,
          const _ExperienceWidget(
            date: '12/2018 to 12/2019',
            companyName: 'EthioLearning',
            role: 'Lead Mobile Application Developer',
            description:
                "Worked as the Lead Flutter Engineer, building the first E-learning platform in Ethiopia. The app has many features for students to learn from anywhere and anytime.",
          ),
        ],
      ),
    );
  }
}
