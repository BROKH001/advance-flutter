import 'package:e_commerce_app/features/authentication/controllers/auth/signup_controller.dart';
import 'package:e_commerce_app/features/authentication/view/signup/widgets/term_conditional_checkbox.dart';
import 'package:e_commerce_app/utils/constants/size.dart';
import 'package:e_commerce_app/utils/constants/text_string.dart';
import 'package:e_commerce_app/utils/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../navigator_screen.dart';
import '../verify_email.dart';

class TSignUpForm extends StatelessWidget {
  const TSignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    bool agree = false;
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          Row(
            spacing: TSizes.spaceBtwInputFields,
            children: [
              Expanded(
                child: TextFormField(
                  expands: false,
                  controller: controller.firstNameController,
                  validator:
                      (value) =>
                          TValidator.validateEmptyText('First Name', value),
                  decoration: InputDecoration(
                    labelText: TTexts.firstName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
              Expanded(
                child: TextFormField(
                  expands: false,
                  controller: controller.lastNameController,
                  validator:
                      (value) =>
                          TValidator.validateEmptyText('Last Name', value),
                  decoration: InputDecoration(
                    labelText: TTexts.lastName,
                    prefixIcon: Icon(Iconsax.user),
                    // border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: TSizes.spaceBtwInputFields),
          TextFormField(
            expands: false,
            validator:
                (value) => TValidator.validateEmptyText('Username', value),
            decoration: InputDecoration(
              labelText: TTexts.username,
              prefixIcon: Icon(Iconsax.user_edit),
            ),
          ),
          SizedBox(height: TSizes.spaceBtwInputFields),
          TextFormField(
            expands: false,
            validator: (value) => TValidator.validateEmail(value),
            decoration: InputDecoration(
              labelText: TTexts.email,
              prefixIcon: Icon(Iconsax.direct),
            ),
          ),
          SizedBox(height: TSizes.spaceBtwInputFields),
          TextFormField(
            expands: false,
            validator: (value) => TValidator.validatePhoneNumber(value),
            decoration: InputDecoration(
              labelText: TTexts.phoneNumber,
              prefixIcon: Icon(Iconsax.call),
            ),
          ),
          SizedBox(height: TSizes.spaceBtwInputFields),
          Obx(
            () => TextFormField(
              expands: false,
              obscureText: controller.hidePassword.value,
              validator: (value) => TValidator.validatePassword(value),
              decoration: InputDecoration(
                labelText: TTexts.password,
                prefixIcon: Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                  onPressed:
                      () =>
                          controller.hidePassword.value =
                              !controller.hidePassword.value,
                  icon:
                      controller.hidePassword.value
                          ? Icon(Iconsax.eye_slash)
                          : Icon(Iconsax.eye),
                ),
              ),
            ),
          ),
          const SizedBox(height: TSizes.defaultSpace / 2),
          const TTermAndConditionalCheckBox(),

          const SizedBox(height: TSizes.spaceBtwSections),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: () {
                // controller.signup();
                // Get.to(VerifyEmailScreen());
                Get.to(() => NavigationMenu());
              },
              child: const Text(
                "Create Account",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
