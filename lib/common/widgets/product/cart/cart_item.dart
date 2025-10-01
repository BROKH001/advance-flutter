import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image.dart';
import '../../../../utils/constants/size.dart';
import '../../images/rounded_image.dart';
import '../../texts/product_title_text.dart';
import '../../texts/t_brand_title_with_verified_icon.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TRoundedImage(imageUrl: TImage.product1, width: 80, height: 80, backgroundColor: TColors.grey,),

        const SizedBox(width: TSizes.spaceBtwItems),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              TBrandTitleWithVerifiedIcon(title: 'Nike'),
              Flexible(child: TProductTitle(title: 'Black Sports Shoes', maxLines: 1,)),

              Text.rich(
                TextSpan(
                    children: [
                      TextSpan(text: 'Color ', style: Theme.of(context).textTheme.bodySmall),
                      TextSpan(text: 'Green ', style: Theme.of(context).textTheme.bodyLarge),
                      TextSpan(text: 'Size ', style: Theme.of(context).textTheme.bodySmall),
                      TextSpan(text: 'UK 08 ', style: Theme.of(context).textTheme.bodyLarge),
                    ]
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
