import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/size.dart';

class TRatingAndShare extends StatelessWidget {
  const TRatingAndShare({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /// -- Rating
        Row(
          children: [
            Icon(Iconsax.star5, color: Colors.yellow, size: TSizes.iconMd),
            SizedBox(width: TSizes.spaceBtwItems / 2),
            Text.rich(
              TextSpan(
                  children: [
                    TextSpan(text: '4.5', style: Theme.of(context).textTheme.bodyLarge),
                    TextSpan(text: '(199)')
                  ]
              ),
            ),
          ],
        ),
        /// -- Shear Button
        IconButton(onPressed: () {}, icon: Icon(Icons.share, size: TSizes.iconMd))
      ],
    );
  }
}