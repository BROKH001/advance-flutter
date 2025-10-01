import 'package:flutter/material.dart';

class TShadow {
  static final verticalProductShadow = BoxShadow(
    color: Colors.white.withOpacity(0.3),
    blurRadius: 3,
    spreadRadius: 0.5,
    offset: Offset(0, 0.5)
  );

  static final horizontalProductShadow = BoxShadow(
    color: Colors.grey.withOpacity(0.3),
    blurRadius: 3,
    spreadRadius: 0.5,
    offset: Offset(0, 0.5)
  );
}