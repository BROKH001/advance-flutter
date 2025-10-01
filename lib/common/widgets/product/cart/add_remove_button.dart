import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/size.dart';
import '../../icons/circular_icons.dart';

class TProductQuantityWithAddRemoveButton extends StatelessWidget {
  const TProductQuantityWithAddRemoveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TCircularIcon(icon: Iconsax.minus, width: 32, height: 32, color: Colors.white, size: TSizes.md, backgroundColor: Colors.redAccent.shade200, onPressed: () {}),
        const SizedBox(width: TSizes.spaceBtwItems),
        Text('2', style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(width: TSizes.spaceBtwItems),
        TCircularIcon(icon: Iconsax.add, width: 32, height: 32, color: Colors.white, size: TSizes.md, backgroundColor: Colors.green.shade200, onPressed: () {}),
      ],
    );
  }
}
