
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/helper/helper_functions.dart';

class TProfileMenu extends StatelessWidget {
  const TProfileMenu({
    super.key,
    required this.title,
    required this.value,
    this.icon = Iconsax.arrow_right_4,
    required this.onTap,
  });

  final String title, value;
  final VoidCallback onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      children: [
        Expanded(flex: 3, child: Text(title, style: Theme.of(context).textTheme.bodySmall)),
        Expanded(flex: 5, child: Text(value, style: Theme.of(context).textTheme.bodyMedium)),
        Expanded(child: IconButton(onPressed: onTap, icon: Icon(icon, color: dark ? TColors.white : TColors.dark))),
      ],
    );
  }
}