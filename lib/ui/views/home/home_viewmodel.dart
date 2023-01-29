import 'package:portfolio/service/url_launcher_service.dart';
import 'package:portfolio/utils/menu_items_helper.dart';
import 'package:stacked/stacked.dart';
import 'package:portfolio/app/app.locator.dart';

class HomeViewModel extends BaseViewModel {
  final _urlLauncherService = locator<UrlLauncherService>();

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
    _selectedMenuItem = item!;
    notifyListeners();
  }

  void onLinkTap(String link) {
    _urlLauncherService.openLink(link);
  }

  void sendEmail() {
    _urlLauncherService.sendEmail('tekalukas@gmail.com');
  }
}
