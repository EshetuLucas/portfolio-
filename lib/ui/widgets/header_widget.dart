import 'package:flutter/material.dart';
import 'package:portfolio/ui/common/ui_helpers.dart';
import 'package:portfolio/utils/menu_items_helper.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../common/app_colors.dart';
import '../common/app_text_styles.dart';
import 'custom_drop_down.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key? key,
    required this.onChanged,
    required this.selectedMenuItem,
  }) : super(key: key);
  final Function(AppsMenuItem?)? onChanged;
  final AppsMenuItem selectedMenuItem;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 45,
        child: ResponsiveBuilder(
          builder: (context, sizingInformation) => Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'PORTFOLIO',
                style:
                    ktsBoldMeidumDarkTextStyle.copyWith(color: kcPrimaryColor),
              ),
              const Spacer(),
              if (sizingInformation.screenSize.width < 540)
                CustomDropDown(
                    items: AppsMenuItem.menuItems, onChanged: onChanged)
              else
                for (var item in AppsMenuItem.menuItems)
                  SizedBox(
                    width: sizingInformation.screenSize.width > 800 ? 126 : 70,
                    child: GestureDetector(
                      onTap: () {
                        onChanged!(item);
                      },
                      child: Card(
                          color: kcSecondaryColor,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 3),
                          clipBehavior: Clip.antiAlias,
                          elevation:
                              selectedMenuItem.title == item.title ? 6 : 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2),
                          ),
                          shadowColor: kcPrimaryColor,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                horizontalSpaceTiny,
                                Icon(
                                  item.iconData,
                                  color: selectedMenuItem.title == item.title
                                      ? kcPrimaryColor
                                      : kcDarkGreyColor,
                                  size: selectedMenuItem.title == item.title
                                      ? 22
                                      : 20,
                                ),
                                horizontalSpaceTiny,
                                if (sizingInformation.screenSize.width > 800)
                                  Text(
                                    item.title,
                                    style: ktsSmallDarkTextStyle.copyWith(
                                      fontSize:
                                          selectedMenuItem.title == item.title
                                              ? 15
                                              : 12,
                                      color:
                                          selectedMenuItem.title == item.title
                                              ? kcPrimaryColor
                                              : kcDarkGreyColor,
                                    ),
                                  )
                              ],
                            ),
                          )

                          //  Padding(
                          //   padding: const EdgeInsets.only(bottom: 0),
                          //   child: ListTile(
                          //     onTap: () {
                          //       onChanged!(item);
                          //     },
                          //     minLeadingWidth: 10,
                          //     horizontalTitleGap: 12,
                          //     contentPadding: EdgeInsets.zero,
                          //     leading: item.iconData != null
                          //         ? Icon(
                          //             item.iconData,
                          //             color: selectedMenuItem.title == item.title
                          //                 ? kcPrimaryColor
                          //                 : kcDarkGreyColor,
                          //             size: selectedMenuItem.title == item.title
                          //                 ? 30
                          //                 : 20,
                          //           )
                          //         : null,
                          //     title: sizingInformation.screenSize.width > 800
                          //         ? Text(
                          //             item.title,
                          //             style: ktsSmallDarkTextStyle.copyWith(
                          //               fontSize:
                          //                   selectedMenuItem.title == item.title
                          //                       ? 14
                          //                       : 12,
                          //               color: selectedMenuItem.title == item.title
                          //                   ? kcPrimaryColor
                          //                   : kcDarkGreyColor,
                          //             ),
                          //           )
                          //         : null,
                          //   ),
                          // ),
                          ),
                    ),
                  ),
            ],
          ),
        ));
  }
}
