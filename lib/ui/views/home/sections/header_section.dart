import 'package:flutter/material.dart';
import 'package:portfolio/ui/common/app_colors.dart';
import 'package:portfolio/ui/common/app_text_styles.dart';
import 'package:portfolio/ui/common/ui_helpers.dart';
import 'package:portfolio/ui/views/home/home_viewmodel.dart';
import 'package:portfolio/ui/widgets/header_widget.dart';
import 'package:stacked/stacked.dart';

class HeaderSection extends ViewModelWidget<HomeViewModel> {
  const HeaderSection({
    super.key,
    required this.homeKey,
    required this.projectsKey,
    required this.skillsKey,
    required this.testimonyKey,
    required this.contactKey,
  });

  final GlobalKey<State<StatefulWidget>> homeKey;
  final GlobalKey<State<StatefulWidget>> projectsKey;
  final GlobalKey<State<StatefulWidget>> skillsKey;
  final GlobalKey<State<StatefulWidget>> testimonyKey;
  final GlobalKey<State<StatefulWidget>> contactKey;

  void duka(GlobalKey<State<StatefulWidget>> key, BuildContext context) {
    Scrollable.ensureVisible(
      key.currentContext ?? context,
      duration: const Duration(seconds: 1),
    );
  }

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return ColoredBox(
      color: kcWhite,
      child: Column(
        children: [
          verticalSpaceMedium,
          Padding(
            padding: appSymmetricEdgePadding(context),
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
                  case 'Skills':
                    key = skillsKey;
                    break;
                  case 'Testimony':
                    key = testimonyKey;
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
    );
  }
}
