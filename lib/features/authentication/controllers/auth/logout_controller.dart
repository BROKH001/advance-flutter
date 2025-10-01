import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'package:e_commerce_app/features/authentication/view/login/login.dart'; // Adjust path
import 'package:e_commerce_app/utils/constants/api.dart';

class LogoutController extends GetxController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  RxBool isLoading = false.obs;

  Future<void> logout() async {
    try {
      isLoading.value = true;

      final SharedPreferences prefs = await _prefs;
      final String? token = prefs.getString('token');

      if (token != null) {
        try {
          final Uri logoutUri = Uri.parse(APIConstrain.tSecretAPIKey + AuthEndPoints.tLogout); // Example: Your base URL + /auth/logout

          final response = await http.post(
            logoutUri,
            headers: {
              'Content-Type': 'application/json; charset=UTF-8',
              'Authorization': 'Bearer $token',
            },
          );

          if (response.statusCode == 200 || response.statusCode == 204) { // 204 No Content is also a common success for logout
            Get.log("Successfully logged out from API.");
          } else {
            Get.log("API Logout Error: ${response.statusCode} - ${response.body}");
          }
        } catch (e) {
          // Log the error from API call but continue with local logout
          Get.log("API Logout Exception: $e");
        }
      }

      // 2. Clear local session data (always do this regardless of API call success)
      await prefs.remove('token');

      isLoading.value = false;
      Get.offAll(() => const LoginScreen()); // Use your actual LoginScreen widget

      Get.snackbar(
        "Logged Out",
        "You have been successfully logged out.",
        snackPosition: SnackPosition.BOTTOM,
      );

    } catch (e) {
      isLoading.value = false;
      // This catch block will handle errors from SharedPreferences or other unexpected issues
      Get.snackbar(
        "Error",
        "Could not log out: ${e.toString()}",
        snackPosition: SnackPosition.BOTTOM,
      );
      Get.log("Local Logout Exception: $e");
    }
  }
}
