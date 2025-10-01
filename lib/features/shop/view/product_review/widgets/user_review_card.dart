import 'package:e_commerce_app/common/widgets/custom_shap/containers/circle_container.dart';
import 'package:e_commerce_app/utils/constants/image.dart';
import 'package:e_commerce_app/utils/constants/size.dart';
import 'package:e_commerce_app/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../../../common/widgets/product/rating/rating_bar_indicator.dart';
import '../../../../../utils/constants/colors.dart';

class TUserReviewCard extends StatelessWidget {
  const TUserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(backgroundImage: AssetImage(TImage.userProfile), backgroundColor: dark ? TColors.light : TColors.dark),
                const SizedBox(width: TSizes.spaceBtwItems),
                Text('Sun Bro KH', style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems),

        /// -- Review
        Row(
          children: [
            TRatingBarIndicator(rating: 4),
            SizedBox(width: TSizes.spaceBtwItems),
            Text('11 Nov, 2025', style: Theme.of(context).textTheme.bodySmall),
          ],
        ),

        SizedBox(height: TSizes.spaceBtwItems),
        ReadMoreText(
          'This is the description of the product and it can go up to 4 lines.',
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimCollapsedText: '  Show more',
          trimExpandedText: '  Less',
          moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primary),
          lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primary),
        ),
        const SizedBox(height: TSizes.spaceBtwItems),

        /// -- Company Review
        TRoundedContainer(
          backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
          child: Padding(
            padding: EdgeInsets.all(TSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('AGODA Store', style: Theme.of(context).textTheme.titleMedium),
                    Text('11 Nov, 2025', style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),

                const SizedBox(height: TSizes.spaceBtwItems),
                ReadMoreText(
                  'This is the description of the product and it can go up to 4 lines. This is the description of the product and it can go up to 4 lines',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: '  Show more',
                  trimExpandedText: '  Less',
                  moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primary),
                  lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primary),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
      ],
    );
  }
}
