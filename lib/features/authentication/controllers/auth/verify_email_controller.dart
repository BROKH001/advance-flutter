
import 'dart:async';

import 'package:e_commerce_app/common/widgets/success/success_screen.dart';
import 'package:e_commerce_app/data/repositories/authentication/repo_authentication.dart';
import 'package:e_commerce_app/utils/constants/image.dart';
import 'package:e_commerce_app/utils/popup/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    checkEmailVerificationStatus();
    super.onInit();
  }

  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      TLoaders.successSnackBar(title: 'Email Sent', message: 'Please check your email to verify your account.');

    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if(user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(() => SuccessScreen(
            image: TImage.successVerify,
            title: 'Your Account Created Successfully.',
            subTitle: '',
            onPressed: () => AuthenticationRepository.instance.screenRedirect()
        ));
      }
    });
  }

  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if(currentUser != null && currentUser.emailVerified) {
      Get.off(() => SuccessScreen(
          image: TImage.successVerify,
          title: 'Congratulations!!',
          subTitle: 'Your Account Created Successfully.',
          onPressed: () => AuthenticationRepository.instance.screenRedirect()
      ));
    }
  }
}