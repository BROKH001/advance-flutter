import 'package:e_commerce_app/features/authentication/view/login/login.dart';
import 'package:e_commerce_app/utils/constants/size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/image.dart';
import '../../../../utils/helper/helper_functions.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Get.back(),
            icon: Icon(CupertinoIcons.clear),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: AssetImage(TImage.successVerify),
              width: THelperFunctions.screenWidth(),
              alignment: Alignment.center,
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            Text(
              "Password Reset Email Send",
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            Text(
              "qwertyuioljhgfdsxcvbnm",
              style: Theme.of(context).textTheme.labelMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handle button press
                  Get.to(LoginScreen());
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.blue),
                ),
                child: Text('Done'),
              ),
            ),
            const SizedBox(height: TSizes.defaultSpace,),
            SizedBox(
              width: double.infinity,
              child: TextButton(onPressed: () {}, child: Text("Resend Email")),
            ),
          ],
        ),
      ),
    );
  }
}
