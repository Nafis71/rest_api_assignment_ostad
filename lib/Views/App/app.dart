import 'package:device_preview_minus/device_preview_minus.dart';
import 'package:flutter/material.dart';
import 'package:rest_api_assignment_ostad/Utils/routes.dart';
import '../../Themes/appbar_themes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppbarThemes.getAppbarStyle(),
      ),
      initialRoute: Routes.homeScreen,
      onGenerateRoute: (routeSettings){
        return Routes.generateRoute(routeSettings);
      },
    );
  }
}
