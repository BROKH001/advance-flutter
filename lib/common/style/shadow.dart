import 'package:flutter/material.dart';

class TShadow {
  static final verticalProductShadow = BoxShadow(
    color: Colors.white.withOpacity(0.3),
    blurRadius: 50,
    spreadRadius: 8,
    offset: Offset(0, 1)
  );

  static final horizontalProductShadow = BoxShadow(
    color: Colors.grey.withOpacity(0.3),
    blurRadius: 50,
    spreadRadius: 8,
    offset: Offset(0, 1)
  );
}