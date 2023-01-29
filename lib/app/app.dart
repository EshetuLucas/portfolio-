import 'package:portfolio/service/url_launcher_service.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:portfolio/ui/views/home/home_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    // @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: UrlLauncherService),
    // @stacked-service
  ],
  logger: StackedLogger(),
)
class App {}
