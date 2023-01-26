import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/ui/common/app_colors.dart';
import 'package:portfolio/ui/common/app_text_styles.dart';
import 'package:portfolio/utils/menu_items_helper.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({
    Key? key,
    this.onChanged,
    this.hint,
    required this.items,
    this.backgroundColor = kcWhite,
    this.textColor = kcDarkGreyColor,
    this.buttonHeight = 10,
    this.itemHeight = 70,
    this.dropdownWidth = 190,
    this.borderRadius,
    this.offset = const Offset(-150, 0),
  }) : super(key: key);

  final Widget? hint;
  final Function(AppsMenuItem?)? onChanged;
  final List<AppsMenuItem> items;
  final Color backgroundColor;
  final Color textColor;
  final double buttonHeight;
  final double itemHeight;
  final double dropdownWidth;
  final Offset offset;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        hint: hint,
        customButton: hint ??
            const Icon(
              Icons.menu_rounded,
              size: 40,
              color: kcPrimaryColor,
            ),
        buttonHeight: buttonHeight,
        buttonWidth: 5,
        itemHeight: itemHeight,
        items: [
          ...items.map(
            (item) => DropdownMenuItem<AppsMenuItem>(
              value: item,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: ListTile(
                  leading: item.iconData != null
                      ? Icon(
                          item.iconData,
                          color: kcPrimaryColor,
                          size: 23,
                        )
                      : null,
                  title: Text(
                    item.title,
                    style: ktsSmallDarkTextStyle.copyWith(
                      fontSize: 12,
                      color: textColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
        onChanged: (value) {
          onChanged?.call(value as AppsMenuItem);
        },
        itemPadding: const EdgeInsets.only(left: 10, right: 10),
        dropdownWidth: dropdownWidth,
        dropdownPadding: const EdgeInsets.symmetric(vertical: 10),
        dropdownDecoration: BoxDecoration(
          borderRadius: borderRadius ??
              const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
                topLeft: Radius.circular(10),
              ),
          color: backgroundColor,
        ),
        dropdownElevation: 8,
        offset: offset,
      ),
    );
  }
}

class MenuItems {
  static List<AppsMenuItem> firstItems = AppsMenuItem.menuItems;

  static Widget buildItem(AppsMenuItem item) {
    return Row(
      children: [
        Icon(item.iconData, color: Colors.white, size: 22),
        const SizedBox(
          width: 10,
        ),
        Text(
          item.title,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
