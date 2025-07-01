import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import '../../theme/theme.dart';

class TabletResponsive extends StatelessWidget {
  const TabletResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Responsive Web Application",
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      // home: const MyHomePage(),
    );
  }
}
