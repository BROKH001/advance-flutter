import 'package:e_commerce_app/features/authentication/controllers/auth/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../navigator_screen.dart';
import '../../../../../utils/constants/size.dart';
import '../../../../../utils/validators/validator.dart';
import '../../password_configuration/forget_password_screen.dart';
import '../../signup/signup.dart';

class TLoginForm extends StatefulWidget {
  const TLoginForm({super.key});

  @override
  State<TLoginForm> createState() => _TLoginFormState();
}

class _TLoginFormState extends State<TLoginForm> {
  bool isCheck = false;
  bool isRemember = false;
  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.loginFormKey,
      child: Column(
        children: [
          TextFormField(
            expands: false,
            controller: controller.emailController.value,
            validator: (value) => TValidator.validateEmail(value),
            decoration: InputDecoration(
              labelText: 'Email',
              prefixIcon: Icon(Iconsax.direct),
            ),
          ),
          SizedBox(height: TSizes.spaceBtwInputFields),
          TextFormField(
            expands: false,
            controller: controller.passwordController.value,
            validator: (value) => TValidator.validatePassword(value),
            obscureText: isCheck,
            decoration: InputDecoration(
              labelText: 'Password',
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: IconButton(
                icon:
                    isCheck != true
                        ? Icon(Iconsax.eye_slash)
                        : Icon(Iconsax.eye),
                onPressed: () {
                  setState(() {
                    isCheck = !isCheck;
                  });
                },
              ),
            ),
          ),
          // const SizedBox(height: TSizes.defaultSpace,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Checkbox(
                value: isRemember,
                onChanged: (value) {
                  setState(() {
                    isRemember = value ?? true;
                  });
                },
                activeColor: Colors.blue,
              ),
              const Text("Remember me", style: TextStyle(fontSize: 16)),
              const Spacer(),
              TextButton(
                onPressed: () => Get.to(() => ForgetPasswordScreen()),
                child: const Text("Forgot Password?"),
              ),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwSections),
          Obx(() {
            return SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                clipBehavior: Clip.hardEdge,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () {
                  // if (controller.loginFormKey.currentState!.validate()) {
                  //   controller.loginUser();
                  // }
                  Get.to(() => NavigationMenu());
                },
                child:
                    controller.isLoading.value
                        ? FutureBuilder(
                          future: Future.delayed(Duration(seconds: 2)),
                          builder: (context, snapshot) {
                            return CircularProgressIndicator();
                          },
                        )
                        : Text("Login"),
              ),
            );
          }),
          const SizedBox(height: TSizes.defaultSpace),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                side: const BorderSide(color: Colors.blue),
              ),
              onPressed: () {
                Get.to(
                  SignUpScreen(),
                  transition: Transition.topLevel,
                  duration: const Duration(milliseconds: 1500),
                );
              },
              child: const Text("Create an Account", style: TextStyle(color: Colors.blue)),
            ),
          ),
        ],
      ),
    );
  }
}
