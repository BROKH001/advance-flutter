import 'package:e_commerce_app/features/authentication/controllers/auth/signup_controller.dart';
import 'package:e_commerce_app/features/authentication/view/signup/widgets/signup_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/constants/image.dart';
import '../../../../utils/constants/size.dart';
import '../login/login.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(
          // top: TSizes.appBarHeight,
          left: TSizes.defaultSpace,
          right: TSizes.defaultSpace,
          bottom: TSizes.defaultSpace,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Image(
                image: AssetImage(TImage.lightModeLogo),
                fit: BoxFit.cover,
                width: 150,
                height: 80,
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
                      Get.to(const LoginScreen());
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