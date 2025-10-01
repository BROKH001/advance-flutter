import 'package:e_commerce_app/common/widgets/images/circular_image.dart';
import 'package:e_commerce_app/common/widgets/texts/t_brand_title_with_verified_icon.dart';
import 'package:e_commerce_app/utils/constants/enum.dart';
import 'package:e_commerce_app/utils/constants/image.dart';
import 'package:e_commerce_app/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/custom_shap/containers/circle_container.dart';
import '../../../../../common/widgets/texts/product_price_text.dart';
import '../../../../../common/widgets/texts/product_title_text.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/size.dart';

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Price & Sale Price
        Row(
          children: [
            /// -- Sale Tag
            TRoundedContainer(
              radius: TSizes.sm,
              padding: EdgeInsets.symmetric(horizontal: TSizes.sm, vertical: TSizes.xs),
              backgroundColor: TColors.secondary,
              child: Text('25 %', style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black)),
            ),
            /// -- Price
            SizedBox(width: TSizes.spaceBtwItems),
            Text('\$ 250', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough, color: Colors.red.shade400), maxLines: 1, overflow: TextOverflow.ellipsis),
            SizedBox(width: TSizes.spaceBtwItems),
            TProductPriceText(price: '175', isLarge: true, textColor: Colors.lightGreen.shade600),
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems / 1.5),

        /// -- Title
        const TProductTitle(title: 'Green Nike Air Shoes'),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),
        /// -- Stock Status
        Row(
          children: [
            const TProductTitle(title: 'Status'),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text('In-Stock', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),

        /// -- Brand
        Row(
          children: [
            TCircularImage(
              image: TImage.product1,
              width: 32,
              height: 32,
              overlayColor: darkMode ? TColors.white : TColors.black,
            ),
            TBrandTitleWithVerifiedIcon(title: 'Nike', brandTextSize: TextSizes.medium),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),
      ],
    );
  }
}
