import 'package:flutter/gestures.dart';
import 'package:portfolio/service/url_launcher_service.dart';
import 'package:portfolio/utils/menu_items_helper.dart';
import 'package:stacked/stacked.dart';
import 'package:portfolio/app/app.locator.dart';
import 'package:portfolio/enums/bottom_sheet_type.dart';
import 'package:portfolio/enums/dialog_type.dart';
import 'package:portfolio/ui/common/app_strings.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _urlLauncherService = locator<UrlLauncherService>();

  String get counterLabel => 'Counter is: $_counter';

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

  int _counter = 0;

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }

  void onChange(AppsMenuItem? item) {
    _selectedMenuItem = item!;
    notifyListeners();
  }

  void showDialog() {
    _dialogService.showCustomDialog(
        variant: DialogType.infoAlert,
        title: 'Stacked Rocks!',
        description: 'Give stacked $_counter stars on Github ');
  }

  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: ksHomeBottomSheetTitle,
      description: ksHomeBottomSheetDescription,
    );
  }

  void onLinkTap(String link) {
    _urlLauncherService.openLink(link);
  }
}
