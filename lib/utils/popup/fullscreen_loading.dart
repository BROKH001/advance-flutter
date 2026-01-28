import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/widgets/loaders/animation_loading.dart';

class TFullScreenLoading {
  static final dark = THelperFunctions.isDarkMode(Get.context!);
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder:
          (_) => PopScope(
        canPop: false,
        child: Container(
          color: dark ? TColors.dark : TColors.white,
          width: double.infinity,
          height: THelperFunctions.screenHeight(),
          child: Column(
            children: [
              const SizedBox(height: 250),
              TAnimationLoadingWidget(text: text, animation: animation),
            ],
          ),
        ),
      ),
    );
  }

  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
