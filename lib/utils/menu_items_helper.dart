import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppsMenuItem {
  final String title;
  final IconData? iconData;
  final String uri;
  final Locale? locale;

  AppsMenuItem({
    required this.title,
    this.iconData,
    required this.uri,
    this.locale,
  });

  static List<AppsMenuItem> get menuItems => [
        AppsMenuItem(
          uri: '/tasks',
          title: 'Home',
          iconData: Icons.home,
        ),
        AppsMenuItem(
          uri: '/projects',
          title: 'Projects',
          iconData: Icons.note_alt_rounded,
        ),
        AppsMenuItem(
          uri: '/teams',
          title: 'Journey',
          iconData: CupertinoIcons.group,
        ),
        AppsMenuItem(
          uri: '/teams',
          title: 'Service',
          iconData: Icons.design_services_rounded,
        ),
        AppsMenuItem(
          uri: '/teams',
          title: 'Contact',
          iconData: Icons.contact_phone_rounded,
        ),
      ];

  static List<AppsMenuItem> get languages => [
        AppsMenuItem(
          uri: '',
          title: 'english'.tr,
          locale: const Locale('en', 'US'),
        ),
        AppsMenuItem(
          uri: '',
          title: 'arabic'.tr,
          locale: const Locale('ar', 'AE'),
        ),
      ];
}
