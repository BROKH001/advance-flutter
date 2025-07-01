import 'package:flutter/material.dart';
import '../../constants/size.dart';

class TIconTheme {
  TIconTheme._();

  static IconThemeData lightIconTheme = const IconThemeData(
    color: Colors.black,
    size: TSizes.iconMd,
    applyTextScaling: true,
  );
  static IconThemeData darkIconTheme = const IconThemeData(
    color: Colors.white,
    size: TSizes.iconMd,
    applyTextScaling: true,
    shadows: [
      Shadow(
        color: Colors.black,
        offset: Offset(0, 1),
        blurRadius: 2,
      ),
    ],
  );
}