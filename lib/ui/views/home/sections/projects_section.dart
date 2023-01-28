import 'package:flutter/material.dart';
import 'package:portfolio/ui/common/app_colors.dart';
import 'package:portfolio/ui/common/app_text_styles.dart';
import 'package:portfolio/ui/common/ui_helpers.dart';
import 'package:portfolio/ui/views/home/home_viewmodel.dart';
import 'package:portfolio/ui/widgets/image_builder.dart';
import 'package:stacked/stacked.dart';

class ProjectsSection extends ViewModelWidget<HomeViewModel> {
  const ProjectsSection({
    super.key,
    required this.projectsKey,
    required this.imageHeight,
    required this.imageHeightOtherProjects,
  });

  final GlobalKey<State<StatefulWidget>> projectsKey;
  final double imageHeight;
  final double imageHeightOtherProjects;

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Column(
      children: [
        Text(
          key: projectsKey,
          'Recent Projects',
          style: ktsLargDarkTextStyle.copyWith(
            color: kcPrimaryColor,
            fontSize: getResponsiveFontSize(
              context,
              minFont: 20,
              maxFont: 60,
            ),
          ),
        ),
        const Text('My latest accomplishements'),
        verticalSpaceMedium,
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1500),
          child: Padding(
            padding: appSymmetricEdgePadding(context),
            child: Wrap(
              spacing: 8,
              children: [
                _ProjectsWidget(
                  onTap: () => viewModel.onLinkTap(
                      'https://play.google.com/store/apps/details?id=com.poly.jester_entertainer'),
                  link:
                      'https://play.google.com/store/apps/details?id=com.poly.jester_entertainer',
                  description:
                      "The Rapture Artist App allows you to create a profile that hosts can browse and book you through. You can upload your images and videos from previous performances, setup your working schedule and communicate with all the hosts directly. Payment is guaranteed for any booking. Hook up your bank account and when you complete your performance the money will be sent directly into your account. It doesn't get any easier than this",
                  title: 'Rapture for Artists',
                  imagePath: 'assets/images/ra.png',
                  imageHeight: imageHeight,
                ),
                _ProjectsWidget(
                  onTap: () => viewModel.onLinkTap(
                      'https://play.google.com/store/apps/details?id=com.poly.jester'),
                  link:
                      'https://play.google.com/store/apps/details?id=com.poly.jester',
                  description:
                      "Rapture is the future of Live Entertainment booking. We are building this app in partnership with artists that use it, event planners and live entertainment agents, to make sure that we deliver the best booking experience you can hope for. We make things convenient by paying in app for bookings, we allow you to chat to artists directly and we have a booking request system that keeps you up to date as the status of your show changes.",
                  title: 'Rapture for Hosts',
                  imagePath: 'assets/images/rc.png',
                  imageHeight: imageHeight,
                ),
                _ProjectsWidget(
                  onTap: () => viewModel.onLinkTap(
                      'https://apps.apple.com/ng/app/jamn/id1634178345'),
                  link: 'https://apps.apple.com/ng/app/jamn/id1634178345',
                  description:
                      "The Jamm app streamlines the five-a-side football experience. From joining leagues to browsing games to join, tracking game stats to splitting payments. Jamm makes sure your energy is spent on the pitch, not away from it. We built both the backend using firebase and the front end using flutter. This project is the second large project of the company next to DD(Delivery Dude App) - DD is a company located in the USA.",
                  title: 'Jamm',
                  imagePath: 'assets/images/jamn.png',
                  imageHeight: imageHeight,
                ),
              ],
            ),
          ),
        ),
        verticalSpaceLarge,
        Text(
          'Other projects',
          style: ktsLargDarkTextStyle.copyWith(
            color: kcPrimaryColor,
            fontSize: getResponsiveFontSize(
              context,
              minFont: 20,
              maxFont: 60,
            ),
          ),
        ),
        verticalSpaceMedium,
        ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1500),
            child: Wrap(
              children: [
                _OtherWidget(
                  onTap: () => viewModel.onLinkTap(
                      'https://play.google.com/store/apps/details?id=com.ethiolearning.et&hl=en&gl=US'),
                  link:
                      'https://play.google.com/store/apps/details?id=com.ethiolearning.et&hl=en&gl=US',
                  description:
                      "Counselors provide counseling services on health issues in our community. For the health problems that people face in their daily life, the health conditions of their families are consulted by experienced doctors. We provide our services to people living in rural areas and cities as well as abroad.",
                  title: 'Amakari',
                  imagePath: 'assets/images/amakari.png',
                  imageHeight: imageHeightOtherProjects,
                  fit: BoxFit.cover,
                ),
                _OtherWidget(
                  onTap: () => viewModel.onLinkTap(
                      'https://play.google.com/store/apps/details?id=com.ethiolearning.et&hl=en&gl=US'),
                  link:
                      'https://play.google.com/store/apps/details?id=com.ethiolearning.et&hl=en&gl=US',
                  description:
                      "The first E-learning platform in Ethiopia. The app has many features for students to learn from anywhere and anytime",
                  title: 'EthioLearning',
                  imagePath: 'assets/images/e.jpeg',
                  imageHeight: imageHeightOtherProjects,
                ),
                _OtherWidget(
                  onTap: () => viewModel.onLinkTap(
                      'https://play.google.com/store/apps/details?id=com.ethiolearning.et&hl=en&gl=US'),
                  link:
                      'https://play.google.com/store/apps/details?id=com.ethiolearning.et&hl=en&gl=US',
                  description:
                      "This app connects all Ethiopian celebrities in different sectors like musicians, Actors, Directors, Producers, journalists, Football players, comedians, and other influential people to thier funs. Funs ask any question and celebrities answer the question.",
                  title: 'Maya Celebrities App',
                  imagePath: 'assets/images/maya.jpg',
                  imageHeight: imageHeightOtherProjects,
                  fit: BoxFit.cover,
                ),
                _OtherWidget(
                  onTap: () => viewModel.onLinkTap(
                      'https://play.google.com/store/apps/details?id=com.Mechot.sanitation&hl=en&gl=US'),
                  link:
                      'https://play.google.com/store/apps/details?id=com.Mechot.sanitation&hl=en&gl=US',
                  description:
                      "Mechot application was developed with the purpose of bringing comfort to the user. Using Mechot, you can navigate to your nearest “Female Friendly”, “Disable Accessible” or “Child Friendly” toilet.",
                  title: 'Mechot',
                  imagePath: 'assets/images/mechot.jpg',
                  imageHeight: imageHeightOtherProjects,
                ),
              ],
            )),
      ],
    );
  }
}

class _ProjectsWidget extends ViewModelWidget<HomeViewModel> {
  const _ProjectsWidget({
    Key? key,
    required this.imageHeight,
    required this.imagePath,
    required this.description,
    required this.title,
    required this.link,
    this.onTap,
  }) : super(key: key);

  final double imageHeight;
  final String imagePath;
  final String title;
  final String description;
  final String link;
  final Function()? onTap;

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return MouseRegion(
      key: Key(title),
      onEnter: (_) => viewModel.onMouseEnter(title),
      onExit: (_) => viewModel.onMouseExit(),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: (screenWidth(context) < 800 ? screenWidth(context) : 350),
          minWidth: (screenWidth(context) < 500 ? screenWidth(context) : 200),
        ),
        child: GestureDetector(
          onTap: onTap,
          child: Card(
            clipBehavior: Clip.antiAlias,
            elevation: viewModel.title == title ? 50 : 5,
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(viewModel.title == title ? 0 : 5),
            ),
            shadowColor: kcPrimaryColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth:
                        screenWidth(context) < 800 ? screenWidth(context) : 350,
                    minWidth:
                        screenWidth(context) < 500 ? screenWidth(context) : 200,
                    maxHeight: imageHeight,
                    minHeight: imageHeight,
                  ),
                  child: ImageBuilder(
                    imagePath: imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
                verticalSpaceSmall,
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: ktsLargDarkTextStyle.copyWith(
                          color: kcPrimaryColor,
                          fontSize: getResponsiveFontSize(context,
                              minFont: 20, maxFont: 25, dividedBy: 35),
                        ),
                      ),
                      Text(
                        description,
                        style: ktsSmallDarkTextStyle.copyWith(
                          fontSize: getResponsiveFontSize(context,
                              minFont: 12, maxFont: 14, dividedBy: 55),
                        ),
                      ),
                      verticalSpaceSmall,
                      Card(
                        shadowColor: kcPrimaryColor,
                        elevation: 3,
                        color: kcSecondaryColor,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.link_sharp,
                                  color: kcPrimaryColor,
                                  size: 26,
                                ),
                                horizontalSpaceSmall,
                                Text(
                                  'Link',
                                  style: ktsBoldTextStyle.copyWith(
                                      color: kcPrimaryColor),
                                ),
                                horizontalSpaceSmall,
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _OtherWidget extends ViewModelWidget<HomeViewModel> {
  const _OtherWidget(
      {Key? key,
      required this.imageHeight,
      required this.imagePath,
      required this.description,
      required this.title,
      required this.link,
      this.onTap,
      this.fit = BoxFit.cover})
      : super(key: key);

  final double imageHeight;
  final String imagePath;
  final String title;
  final String description;
  final String link;
  final BoxFit fit;
  final Function()? onTap;
  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return MouseRegion(
      key: Key(title),
      onEnter: (_) => viewModel.onMouseEnter(title),
      onExit: (_) => viewModel.onMouseExit(),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: (screenWidth(context) < 300 ? screenWidth(context) : 300),
          minWidth: (screenWidth(context) < 300 ? screenWidth(context) : 200),
        ),
        child: GestureDetector(
          onTap: onTap,
          child: Card(
            clipBehavior: Clip.antiAlias,
            elevation: viewModel.title == title ? 50 : 5,
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(viewModel.title == title ? 0 : 5),
            ),
            shadowColor: kcPrimaryColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth:
                        screenWidth(context) < 300 ? screenWidth(context) : 350,
                    minWidth:
                        screenWidth(context) < 300 ? screenWidth(context) : 200,
                    maxHeight: imageHeight,
                    minHeight: imageHeight,
                  ),
                  child: ImageBuilder(
                    imagePath: imagePath,
                    fit: fit,
                  ),
                ),
                verticalSpaceSmall,
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: ktsLargDarkTextStyle.copyWith(
                          color: kcPrimaryColor,
                          fontSize: getResponsiveFontSize(context,
                              minFont: 20, maxFont: 30, dividedBy: 45),
                        ),
                      ),
                      Text(
                        description,
                        style: ktsSmallDarkTextStyle.copyWith(
                          fontSize: getResponsiveFontSize(context,
                              minFont: 12, maxFont: 15, dividedBy: 65),
                        ),
                      ),
                      verticalSpaceSmall,
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
