import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/theme.dart';

class DesktopResponsive extends StatelessWidget {
  const DesktopResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Responsive Web Application",
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      // home: const OnBoardingScreen(),
    );
  }
}
