import 'package:e_commerce_app/features/authentication/view/login/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/image.dart';
import '../../../../utils/constants/size.dart';
import '../../../../utils/helper/helper_functions.dart';
import '../../controllers/auth/login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool rememberMe = false;
  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(
            top: TSizes.appBarHeight,
            left: TSizes.defaultSpace,
            right: TSizes.defaultSpace,
            bottom: TSizes.defaultSpace,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  image: dark ? AssetImage(TImage.darkModeLogo) : AssetImage(TImage.lightModeLogo),
                  fit: BoxFit.cover,
                  width: THelperFunctions.screenWidth() * 0.5,
                  height: THelperFunctions.screenWidth() * 0.3,
                ),
                const SizedBox(height: TSizes.spaceBtwSections),
                const Text(
                  "Welcome Back",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: TSizes.defaultSpace / 2),
                const Text(
                  "Please enter your credentials to auth.",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: TSizes.defaultSpace),
                const TLoginForm(),
                const SizedBox(height: TSizes.defaultSpace),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: TSizes.defaultSpace * 1.8,
                  ),
                  child: const SizedBox(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Divider(color: Colors.grey, height: 0.5),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: TSizes.defaultSpace / 2,
                          ),
                          child: Text(
                            "Or Sign In with",
                            style: TextStyle(color: Colors.blueGrey),
                          ),
                        ),
                        Expanded(
                          child: Divider(color: Colors.grey, height: 0.5),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: TSizes.defaultSpace),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      child: Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.cyanAccent,
                            width: 2.0,
                          ),
                        ),
                        child: const CircleAvatar(
                          backgroundImage: AssetImage(TImage.facebook),
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                      onTap: () {
                        // Handle Facebook login
                      },
                    ),
                    const SizedBox(width: TSizes.defaultSpace),
                    GestureDetector(
                      child: Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.cyanAccent,
                            width: 2.0,
                          ),
                        ),
                        child: const CircleAvatar(
                          backgroundImage: AssetImage(TImage.google),
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                      onTap: () {
                        // Handle Facebook login
                      },
                    ),
                  ],
                ),
                const SizedBox(height: TSizes.defaultSpace),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
