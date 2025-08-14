
import 'dart:convert';
import 'dart:io';
import 'package:e_commerce_app/utils/constants/api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductService {

  // Create  ....
  Future<String> getProductData() async {
    String url = '${APIConstrain.tSecretAPIKey}/products/';
    try {
      http.Response response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        var json = response.body;
        return json;
      } else {
        debugPrint("Error : ${response.statusCode}");
        throw Exception('Error Code : ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network Error: $e');
    }
  }

  // Read  ....


  // Update  ....


  // Delete  ....

}