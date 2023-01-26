import 'package:flutter/material.dart';
import 'package:portfolio/ui/common/app_text_styles.dart';
import 'package:portfolio/ui/widgets/header_widget.dart';
import 'package:portfolio/ui/widgets/image_builder.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:shape_of_view_null_safe/shape_of_view_null_safe.dart';
import 'package:stacked/stacked.dart';
import 'package:portfolio/ui/common/app_colors.dart';
import 'package:portfolio/ui/common/ui_helpers.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  HomeView({Key? key}) : super(key: key);
  final projectsKey = GlobalKey();
  final homeKey = GlobalKey();
  final serviceKey = GlobalKey();
  final contactKey = GlobalKey();

  void duka(GlobalKey<State<StatefulWidget>> key, BuildContext context) {
    Scrollable.ensureVisible(
      key.currentContext ?? context,
      duration: const Duration(seconds: 1),
    );
  }

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    double arcShape = getResponsiveSize(context) / 30;

    double imageHeight =
        (screenWidth(context) < 800 ? screenWidth(context) : 350) / 2;
    double imageHeightOtherProjects =
        (screenWidth(context) < 300 ? screenWidth(context) : 350) / 2;
    return Scaffold(
      body: SafeArea(
        child: ResponsiveBuilder(
          builder: (context, sizingInformation) => Column(
            children: [
              ColoredBox(
                color: kcSecondaryColor,
                child: Column(
                  children: [
                    verticalSpaceMedium,
                    Padding(
                      padding: appSymmetricEdgePadding,
                      child: HeaderWidget(
                        selectedMenuItem: viewModel.selectedMenuItem,
                        onChanged: (menuItem) {
                          viewModel.onChange(menuItem);
                          GlobalKey<State<StatefulWidget>> key;

                          switch (menuItem!.title) {
                            case 'Home':
                              key = homeKey;
                              break;
                            case 'Projects':
                              key = projectsKey;
                              break;
                            case 'Service':
                              key = serviceKey;
                              break;
                            case 'Contact':
                              key = contactKey;
                              break;

                            default:
                              key = homeKey;
                          }
                          Scrollable.ensureVisible(
                            key.currentContext ?? context,
                            duration: const Duration(seconds: 1),
                          );
                        },
                      ),
                    ),
                    verticalSpaceSmall,
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    child: Column(
                      children: [
                        ShapeOfView(
                          key: homeKey,
                          elevation: 0,
                          shape: ArcShape(
                            direction: ArcDirection.Outside,
                            height: (sizingInformation.screenSize.width < 440
                                ? 3
                                : arcShape > 30
                                    ? 30
                                    : arcShape),
                            position: ArcPosition.Bottom,
                          ),
                          child: ColoredBox(
                            color: kcPrimaryColor.withOpacity(0.2),
                            child: SizedBox(
                              width: screenWidth(context),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  ConstrainedBox(
                                    constraints:
                                        const BoxConstraints(maxWidth: 1100),
                                    child: sizingInformation.screenSize.width <
                                            440
                                        ? Column(
                                            children: [
                                              SizedBox(
                                                height:
                                                    getResponsiveSize(context) /
                                                        3,
                                                width:
                                                    getResponsiveSize(context),
                                                child: const _ImageWidget(),
                                              ),
                                              const _BioTextsWidget(),
                                            ],
                                          )
                                        : Stack(
                                            children: [
                                              Positioned(
                                                top: sizingInformation
                                                            .screenSize.height <
                                                        440
                                                    ? 2
                                                    : 30,
                                                left: screenWidth(context) -
                                                    screenWidth(context) / 2,
                                                child: SizedBox(
                                                  height: getResponsiveSize(
                                                          context) /
                                                      2,
                                                  width: getResponsiveSize(
                                                          context) /
                                                      2,
                                                  child: const _ImageWidget(),
                                                ),
                                              ),
                                              const _BioWidget(),
                                            ],
                                          ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        verticalSpaceLarge,
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
                          constraints: const BoxConstraints(maxWidth: 1100),
                          child: Padding(
                            padding: appSymmetricEdgePadding,
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
                                  link:
                                      'https://apps.apple.com/ng/app/jamn/id1634178345',
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
                        verticalSpaceMedium,
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
                            constraints: const BoxConstraints(maxWidth: 1100),
                            child: Wrap(
                              children: [
                                _OtherWidget(
                                  onTap: () => viewModel.onLinkTap(
                                      'https://play.google.com/store/apps/details?id=com.ethiolearning.et&hl=en&gl=US'),
                                  link:
                                      'https://play.google.com/store/apps/details?id=com.ethiolearning.et&hl=en&gl=US',
                                  description:
                                      "The first E-learning platform in Ethiopia. The app has many features for students to learn from anywhere and anytime",
                                  title: 'EthioLearning',
                                  imagePath: 'assets/images/et1.jpeg',
                                  imageHeight: imageHeightOtherProjects,
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
                                _OtherWidget(
                                  onTap: () => viewModel.onLinkTap(
                                      'https://play.google.com/store/apps/details?id=com.ethiolearning.et&hl=en&gl=US'),
                                  link:
                                      'https://play.google.com/store/apps/details?id=com.ethiolearning.et&hl=en&gl=US',
                                  description:
                                      "The first E-learning platform in Ethiopia. The app has many features for students to learn from anywhere and anytime",
                                  title: 'EthioLearning',
                                  imagePath: 'assets/images/et1.jpeg',
                                  imageHeight: imageHeightOtherProjects,
                                ),
                              ],
                            )),
                        verticalSpaceMedium,
                        Text(
                          'Skills',
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
                          constraints: const BoxConstraints(maxWidth: 1000),
                          child: Wrap(
                            spacing: 4,
                            runSpacing: 4,
                            children: [
                              for (int i = 0; i < 12; i++)
                                SizedBox(
                                    height: 100,
                                    width: 170,
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
                                    ))
                            ],
                          ),
                        ),
                        verticalSpaceMassive,
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}

class _OtherWidget extends ViewModelWidget<HomeViewModel> {
  const _OtherWidget({
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

class _BioWidget extends StatelessWidget {
  const _BioWidget({
    Key? key,
  }) : super(key: key);

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
          height: screenHeight(context) / 2,
        ),
        Container(
          alignment: Alignment.center,
          height: getResponsiveSize(context) / 2,
          width: screenWidth(context) / 2,
          child: Padding(
            padding: appSymmetricEdgePadding,
            child: const _BioTextsWidget(),
          ),
        ),
        Expanded(
            child: SizedBox(
          height: screenHeight(context) / 2,
        )),
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
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: appSymmetricEdgePadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Hello",
            style: ktsSmallDarkTextStyle.copyWith(
              fontSize: getResponsiveFontSize(
                context,
                minFont: 12,
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
                minFont: 20,
                maxFont: 60,
              ),
            ),
          ),
          Text(
            "Software Developer | Specialized in Flutter, Firebase and Web | Building World-Class mobile apps",
            style: ktsSmallDarkTextStyle.copyWith(
              fontSize: getResponsiveFontSize(context,
                  minFont: 12, maxFont: 17, dividedBy: 45),
            ),
          ),
        ],
      ),
    );
  }
}

class _ImageWidget extends StatelessWidget {
  const _ImageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ImageBuilder(
      imagePath: 'assets/images/placeholder.png',
      fit: BoxFit.cover,
    );
  }
}
