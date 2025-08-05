
import 'package:e_commerce_app/features/authentication/view/password_configuration/reset_password_screen.dart';
import 'package:e_commerce_app/utils/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text("Forget password", style: Theme.of(context).textTheme.headlineMedium,),
            SizedBox(height: TSizes.defaultSpace ,),
            // SubTitle
            Text("Please enter your email address. You will receive a link to create a new password via email.", style: Theme.of(context).textTheme.bodyMedium,),
            SizedBox(height: TSizes.spaceBtwSections ,),
            // TextFormField
            TextFormField(
              decoration: InputDecoration(
                labelText: "Email",
                prefixIcon: Icon(Iconsax.direct_right),
              ),
            ),
            SizedBox(height: TSizes.spaceBtwSections ,),
            // Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => ResetPasswordScreen());
                },
                child: Text("Submit"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
