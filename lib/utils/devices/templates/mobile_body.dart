import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import '../../theme/theme.dart';

class MobileResponsive extends StatelessWidget {
  const MobileResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      // home: const MyHomePage(),
    );
  }
}
