
import 'features/authentication/view/boarding/onboarding.dart';
import 'package:e_commerce_app/binding/general_bindings.dart';
import 'package:flutter/material.dart';
import 'utils/theme/theme.dart';
import 'package:get/get.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Khmer Market',
      debugShowCheckedModeBanner: false,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      home: OnBoardingScreen(),
    );
  }
}
