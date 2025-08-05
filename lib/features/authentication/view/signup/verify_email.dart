import 'package:e_commerce_app/utils/constants/image.dart';
import 'package:e_commerce_app/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/utils/constants/size.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/success/success_screen.dart';
import '../../../../utils/constants/text_string.dart';
import '../login/login.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => LoginScreen());
            },
            icon: const Icon(Icons.clear),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Center(
            child: Column(
              children: [
                // an Image
                Image(
                  image: AssetImage(TImage.verifyEmail),
                  width: THelperFunctions.screenWidth() * 0.6,
                ),

                SizedBox(height: TSizes.spaceBtwSections),

                // Title && Subtitle
                Text(
                  TTexts.title,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                Text(
                  TTexts.support,
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                Text(
                  TTexts.subTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: TSizes.spaceBtwSections),

                // Button to Verify Email
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // -- Handle the verification logic here
                      Get.to(() => SuccessScreen(
                        image: TImage.successVerify,
                        title: TTexts.createSuccess,
                        subTitle: TTexts.subSuccess,
                        onPressed: () {
                          Get.to(() => LoginScreen());
                        },
                      ));
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.green),
                    ),
                    child: Text('Verify Email'),
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                TextButton(onPressed: () {}, child: Text('Resend Email')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
