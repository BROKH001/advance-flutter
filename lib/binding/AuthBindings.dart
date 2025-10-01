import 'package:get/get.dart';
import 'package:e_commerce_app/features/authentication/controllers/auth/login_controller.dart';
import 'package:e_commerce_app/features/authentication/controllers/auth/logout_controller.dart';

import '../features/authentication/controllers/auth/signup_controller.dart';

class AuthBindings extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut(() => LoginController());

    Get.lazyPut(() => LogoutController());

    Get.lazyPut(() => SignupController());

    // Get.lazyPut(() => ForgotPasswordController());
  }
}
