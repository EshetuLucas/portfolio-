import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:portfolio/app/app.locator.dart';
import 'package:portfolio/enums/bottom_sheet_type.dart';
import 'package:portfolio/ui/common/app_strings.dart';
import 'package:portfolio/ui/views/home/home_viewmodel.dart';

import '../helpers/test_helpers.dart';

void main() {
  HomeViewModel _getModel() => HomeViewModel();

  group('HomeViewmodelTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
