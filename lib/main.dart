import 'package:flutter/material.dart';
import 'package:portfolio/service/url_launcher_service.dart';
import 'package:portfolio/ui/common/app_colors.dart';
import 'package:portfolio/ui/views/home/home_view.dart';
import 'package:portfolio/ui/views/home/home_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => UrlLauncherService()),
        ChangeNotifierProvider(
          create: (context) => HomeViewModel(
            urlLauncherService: context.read<UrlLauncherService>(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Eshetu Lukas',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          fontFamily: 'Poppins',
          scaffoldBackgroundColor: kcWhite,
          textTheme: const TextTheme(
            bodyMedium: TextStyle(
              fontSize: 14.0,
              color: kcDarkGreyColor,
            ),
          ),
        ),
        home: HomeView(),
      ),
    );
  }
}
