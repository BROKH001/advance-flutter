import 'package:e_commerce_app/features/authentication/view/signup/widgets/signup_form.dart';
import 'package:e_commerce_app/utils/helper/helper_functions.dart';
import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/image.dart';
import '../../../../utils/constants/size.dart';
import '../login/login.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: SAppBar(leadingIcon: Iconsax.arrow_left_1, leadingOnPressed: () => Get.to(() => LoginScreen(), transition: Transition.topLevel, duration: const Duration(milliseconds: 2000))),
      body: Padding(
        padding: const EdgeInsets.only(
          top: TSizes.defaultSpace,
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
              const SizedBox(height: TSizes.defaultSpace),
              const Text(
                "Create an Account",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.defaultSpace / 2),
              const TSignUpForm(),
              const SizedBox(height: TSizes.defaultSpace),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account?",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(width: TSizes.defaultSpace / 3),
                  TextButton(
                    onPressed: () {
                      // Handle login action
                      Get.back();
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}