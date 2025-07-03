import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/image.dart';
import '../../../../utils/constants/size.dart';
import '../../../store/view/main_page.dart';
import '../signup/signup.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  late final TextEditingController _emailController = TextEditingController();
  late final TextEditingController _usernameController = TextEditingController();
  late final TextEditingController _passwordController = TextEditingController();

  bool rememberMe = false;
  bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(
            top: TSizes.appBarHeight,
            left: TSizes.defaultSpace,
            right: TSizes.defaultSpace,
            bottom: TSizes.defaultSpace,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Image(
                  image: AssetImage(TImage.lightModeLogo),
                  fit: BoxFit.cover,
                  width: 150,
                  height: 80,
                ),
                const SizedBox(height: TSizes.defaultSpace),
                const Text(
                  "Welcome Back",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: TSizes.defaultSpace / 2),
                const Text(
                  "Please enter your credentials to login.",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: TSizes.defaultSpace * 2),
                const TextField(
                  decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: TSizes.defaultSpace),
                TextField(
                  // Controller
                  decoration: InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(_isSelected ? Iconsax.eye_slash : Iconsax.eye),
                      onPressed: () {
                        setState(() {
                          _isSelected = !_isSelected;
                        });
                      },
                    ),
                  ),
                  obscureText: _isSelected ? true : false,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: rememberMe,
                      onChanged: (value) {
                        // Handle remember me action
                        setState(() {
                          rememberMe = value ?? true;
                        });
                      },
                      activeColor: Colors.blue,
                    ),
                    const Text(
                      "Remember me",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        // Handle forgot password action
                      },
                      child: const Text(
                        "Forgot Password?",
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: TSizes.defaultSpace * 1.5),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    clipBehavior: Clip.hardEdge,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    onPressed: () {
                      Get.to(
                        const MainPage(),
                        transition: Transition.native,
                        duration: const Duration(milliseconds: 1000),
                      );
                    },
                    child: const Text(
                      "Sign In",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: TSizes.defaultSpace / 2),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: const BorderSide(color: Colors.blue),
                    ),
                    onPressed: () {
                      Get.to(const SignUpScreen(),
                          transition: Transition.native,
                          duration: const Duration(milliseconds: 1000));
                    },
                    child: const Text(
                      "Create an Account",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: TSizes.defaultSpace * 2),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: TSizes.defaultSpace * 1.8,
                  ),
                  child: const SizedBox(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Divider(
                            color: Colors.grey,
                            height: 0.5,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: TSizes.defaultSpace / 2),
                          child: Text(
                            "Or Sign In with",
                            style: TextStyle(
                              color: Colors.blueGrey,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: Colors.grey,
                            height: 0.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: TSizes.defaultSpace),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Handle Facebook login action
                      },
                      child: const CircleAvatar(
                        backgroundImage: AssetImage(
                          TImage.facebook,
                        ),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                    const SizedBox(width: TSizes.defaultSpace),
                    GestureDetector(
                      onTap: () {
                        // Handle Google login action
                      },
                      child: const CircleAvatar(
                        backgroundImage: AssetImage(
                          TImage.google,
                        ),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                    const SizedBox(width: TSizes.defaultSpace),
                    GestureDetector(
                      onTap: () {
                        // Handle GitHub login action
                      },
                      child: const CircleAvatar(
                        backgroundImage: AssetImage(
                          TImage.github,
                        ),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: TSizes.defaultSpace),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
