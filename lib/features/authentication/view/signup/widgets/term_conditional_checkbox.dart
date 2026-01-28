import 'package:e_commerce_app/features/authentication/controllers/auth/signup_controller.dart';
import 'package:e_commerce_app/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/size.dart';

class TTermAndConditionalCheckBox extends StatelessWidget {
  const TTermAndConditionalCheckBox({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Obx(
            () => Checkbox(
              value: controller.privacyPolicy.value,
              onChanged: (value) => controller.privacyPolicy.value = !controller.privacyPolicy.value
            ),
          ),
        ),
        SizedBox(width: TSizes.spaceBtwItems),
        Expanded(
          flex: 1,
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "I agree to the ",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                TextSpan(
                  text: "Privacy Policy",
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: dark ? TColors.white : TColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: dark ? TColors.white : TColors.primary,
                  ),
                ),
                TextSpan(
                  text: " and ",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                TextSpan(
                  text: "Terms of use",
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: dark ? TColors.white : TColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: dark ? TColors.white : TColors.primary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
