import 'package:e_commerce_app/data/repositories/authentication/repo_authentication.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:get/get.dart';
import 'app.dart';

Future<void> main() async {
  // Widget Binding
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // Local storage
  await GetStorage.init();
  
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((FirebaseApp value) => Get.put(AuthenticationRepository()));
  
  runApp(const App());
}

