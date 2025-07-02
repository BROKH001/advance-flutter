import 'package:flutter/material.dart';

import '../../../../utils/constants/size.dart';

class TAppBar extends StatelessWidget {
  final String? title;

  const TAppBar({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title.toString(),
      style: TextStyle(fontSize: TSizes.lg, fontWeight: FontWeight.w700),
    );
  }
}
