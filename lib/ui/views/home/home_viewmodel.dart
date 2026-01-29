import 'package:flutter/material.dart';
import 'package:portfolio/service/url_launcher_service.dart';
import 'package:portfolio/utils/menu_items_helper.dart';

class HomeViewModel extends ChangeNotifier {
  final UrlLauncherService _urlLauncherService;

  HomeViewModel({required UrlLauncherService urlLauncherService})
      : _urlLauncherService = urlLauncherService;

  AppsMenuItem _selectedMenuItem = AppsMenuItem.menuItems.first;
  AppsMenuItem get selectedMenuItem => _selectedMenuItem;

  String title = '';

  void onMouseEnter(String value) {
    title = value;
    notifyListeners();
  }

  void onMouseExit() {
    title = '';
    notifyListeners();
  }

  void onChange(AppsMenuItem? item) {
    if (item != null) {
      _selectedMenuItem = item;
      notifyListeners();
    }
  }

  void onLinkTap(String link) {
    _urlLauncherService.openLink(link);
  }

  void sendEmail() {
    _urlLauncherService.sendEmail('tekalukas@gmail.com');
  }
}
