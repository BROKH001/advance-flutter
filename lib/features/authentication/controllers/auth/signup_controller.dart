import 'package:e_commerce_app/data/repositories/authentication/repo_authentication.dart';
import 'package:e_commerce_app/data/repositories/user/user_repository.dart';
import 'package:e_commerce_app/utils/popup/fullscreen_loading.dart';
import 'package:e_commerce_app/utils/popup/loaders.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/image.dart';
import '../../../../utils/helper/network_manager.dart';
import '../../../personalization/model/user_model.dart';
import '../../view/signup/verify_email.dart';

class SignupController extends GetxController{

  static SignupController get instance => Get.find();

  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();

  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  RxBool loading = false.obs;

  Future<void> signup() async {
    try {
      // loading
      TFullScreenLoading.openLoadingDialog('We are processing your Information...', TImage.loading);

      // connected
      final isConnected = await NetWorkManager.instance.isConnected();
      if (!isConnected) return;

      // FormKey Validate
      if (!signupFormKey.currentState!.validate()) return;

      // Privacy Policy
      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(
            title: 'Accept Privacy Policy',
            message: 'In order to create an account you must accept the privacy policy and terms of use.',
        );
        return ;
      }

      // User Res in the Firebase and save user data in Firebase
      final userCredential  = await AuthenticationRepository.instance.registerWithEmailAndPassword(emailController.text.trim(), passwordController.text.trim());

      // Save User Data in Firebase FireStore
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstNameController.text.trim(),
        lastName: lastNameController.text.trim(),
        username: usernameController.text.trim(),
        email: emailController.text.trim(),
        phoneNumber: phoneController.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      userRepository.saveUserRecord(newUser);

      TLoaders.successSnackBar(title: 'Success', message: 'Account created successfully.');

      Get.to(() => VerifyEmailScreen(email: emailController.text.trim(),));

    } catch(e) {
      TFullScreenLoading.stopLoading();
      TLoaders.errorSnackBar(title: 'On Snap!', message: e.toString());
    } finally {
      TFullScreenLoading.stopLoading();
    }
  }

}