import 'dart:convert';
import 'package:e_commerce_app/utils/constants/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../navigator_screen.dart';
import '../../../store/model/UserModel.dart';

class LoginController extends GetxController{

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final conPasswordController = TextEditingController().obs;
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  RxBool isLoading = false.obs;
  var errorMessage = ''.obs;
  var hasError = false.obs;

  Future<void> loginUser() async {
    if (emailController.value.text.isEmpty || passwordController.value.text.isEmpty) {
      _showError("Email and Password cannot be empty.");
      return;
    }

    isLoading.value = true;
    hasError.value = false;
    errorMessage.value = '';

    try {
      final Uri loginUri = Uri.parse(APIConstrain.tSecretAPIKey + AuthEndPoints.tLogin);

      final response = await http.post(
        loginUri,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json', // Often good to include
        },
        body: jsonEncode({
          'email': emailController.value.text.trim(),
          'password': passwordController.value.text.trim(),
        }),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        final Welcome welcomeData = Welcome.fromJson(responseData); // Parse the full Welcome object

        final SharedPreferences prefs = await _prefs;

        // 1. Store the token
        await prefs.setString('token', welcomeData.token);
        Get.log("Token stored: ${welcomeData.token}");

        // 2. Store the User object as a JSON string (for UserProfileController - Scenario B)
        // This allows UserProfileController's loadUserProfileFromStorage() to work.
        await prefs.setString('user_profile', jsonEncode(welcomeData.user.toJson()));
        Get.log("User profile stored: ${jsonEncode(welcomeData.user.toJson())}");

        isLoading.value = false;
        Get.snackbar(
          "Login Successful",
          welcomeData.message, // Use the message from your API
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        // Navigate to the main screen and remove previous routes
        Get.offAll(() => NavigationMenu()); // Replace MainPage with your actual main screen widget

      } else {
        // Handle API error responses
        String errorMsg = "Login failed. Please try again.";
        try {
          final Map<String, dynamic> errorData = jsonDecode(response.body);
          if (errorData.containsKey('message')) {
            errorMsg = errorData['message'];
          } else if (errorData.containsKey('error')) {
            errorMsg = errorData['error'];
          } else {
            errorMsg = "Login failed: ${response.statusCode}";
          }
        } catch (e) {
          // If response body is not JSON or parsing fails
          errorMsg = "Login failed: ${response.statusCode}. Invalid response from server.";
        }
        _showError(errorMsg);
        Get.log("Login Error: ${response.statusCode} - ${response.body}");
      }
    } catch (e) {
      _showError("An error occurred during login: ${e.toString()}");
      Get.log("Login Exception: $e");
    } finally {
      isLoading.value = false;
    }
  }
  void _showError(String message) {
    hasError.value = true;
    errorMessage.value = message;
    Get.snackbar(
      "Login Error",
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }
}