import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/features/personalization/model/user_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      throw FirebaseException(code: e.code, message: e.message, plugin: '');
    } on FormatException catch (_) {
      throw const FormatException();
    } on PlatformException catch (_) {
      throw PlatformException(
        code: 'Unknown',
        message: 'Something went wrong. Please try again.',
      );
    } catch (_) {
      throw Exception("Something went wrong. Please try again.");
    }
  }
}
