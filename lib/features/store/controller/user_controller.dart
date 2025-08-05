import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'package:e_commerce_app/utils/constants/api.dart'; // Adjust path
// Import your LoginScreen route for redirection if token is invalid
import 'package:e_commerce_app/features/authentication/view/login/login.dart';

import '../model/UserModel.dart'; // Adjust path

class UserProfileController extends GetxController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // Observable for the user model
  var user = Rx<User?>(null); // Use Rx<UserModel?> for nullable user

  // Observables for loading and error states
  var isLoading = true.obs; // Start with loading true to fetch on init
  var hasError = false.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserProfile(); // Fetch profile when controller is initialized
  }

  Future<void> fetchUserProfile() async {
    try {
      isLoading.value = true;
      hasError.value = false;
      errorMessage.value = '';

      final SharedPreferences prefs = await _prefs;
      final String? token = prefs.getString('token');

      if (token == null) {
        hasError.value = true;
        errorMessage.value = "Authentication token not found. Please log in.";
        isLoading.value = false;
        // Optional: Redirect to login
        Get.offAll(() => const LoginScreen());
        return;
      }

      // --- Replace with your actual API endpoint ---
      final Uri profileUri = Uri.parse(APIConstrain.tSecretAPIKey + AuthEndPoints.tUserProfile); // Example: Your base URL + /user/profile

      final response = await http.get(
        profileUri,
        headers: {
          'Content-Type': 'application/json; charset=UTF-_8',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        // Assuming your API returns the user object directly,
        // or nested within a key like 'data': data['data']
        user.value = User.fromJson(data); // Or UserModel.fromJson(data['user']) if nested
      } else if (response.statusCode == 401 || response.statusCode == 403) {
        // Unauthorized or Forbidden
        hasError.value = true;
        errorMessage.value = "Session expired or invalid. Please log in again.";
        await prefs.remove('token'); // Clear invalid token
        Get.offAll(() => const LoginScreen()); // Redirect to login
      } else {
        hasError.value = true;
        errorMessage.value = "Failed to load profile: ${response.statusCode} - ${response.body}";
      }
    } catch (e) {
      hasError.value = true;
      errorMessage.value = "An error occurred: ${e.toString()}";
      Get.log("UserProfileController Error: $e");
    } finally {
      isLoading.value = false;
    }
  }

  // Optional: Method to refresh user profile data
  Future<void> refreshUserProfile() async {
    await fetchUserProfile();
  }

  // Optional: Method to clear user data on logout (can be called by LogoutController)
  void clearUserData() {
    user.value = null;
    // Potentially clear other related states
  }
}

// Example for UserEndPoints if you have it in your api.dart
// class UserEndPoints {
//   static const String tUserProfile = "/user/profile";
//   static const String tUpdateUserProfile = "/user/profile/update";
// }
