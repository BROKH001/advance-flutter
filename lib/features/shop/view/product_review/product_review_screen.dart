import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/utils/constants/size.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/product/rating/rating_bar_indicator.dart';
import 'widgets/progress_indicator_and_rating.dart';
import 'widgets/user_review_card.dart';

class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SAppBar(title: Text('Reviews & Rating'), showBackArrow: true,),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// -- Rating and Review
              Text('Rating and Review are verified and are from people who use the same type of device that you used.'),
              const SizedBox(height: TSizes.spaceBtwItems),

              /// -- Overall Rating Product
              TOverallProductRating(),
              TRatingBarIndicator(rating: 4.5),
              Text('12,500', style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// -- User Review List
              TUserReviewCard(),
              TUserReviewCard(),
              TUserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}






