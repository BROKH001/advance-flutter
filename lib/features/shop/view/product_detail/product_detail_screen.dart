import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/features/shop/view/product_detail/widgets/button_add_to_cart_widget.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

import '../../../../utils/constants/size.dart';
import '../../../../utils/helper/helper_functions.dart';
import '../product_review/product_review_screen.dart';
import 'widgets/product_attributes.dart';
import 'widgets/product_image_slider.dart';
import 'widgets/product_meta_data.dart';
import 'widgets/rating_and_share.dart';

class TProductDetailScreen extends StatelessWidget {
  const TProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: TButtonAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1 - Product Slider
            TProductImageSlider(),

            // 2 - Product Detail
            Padding(
              padding: EdgeInsets.only(left: TSizes.defaultSpace, right: TSizes.defaultSpace, bottom: TSizes.spaceBtwItems),
              child: Column(
                children: [
                  /// -- Rating & Share Button
                  TRatingAndShare(),

                  /// -- Price, Title, Stock & Brand
                  TProductMetaData(),

                  /// -- Attributes
                  TProductAttributes(),
                  SizedBox(height: TSizes.spaceBtwItems),

                  /// -- Check-out Button
                  SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () {}, child: Text('Checkout'))),
                  SizedBox(height: TSizes.spaceBtwItems),
                  
                  /// -- Description
                  TSectionHeading(title: 'Description', showActionButton: false,),
                  SizedBox(height: TSizes.spaceBtwItems),
                  ReadMoreText(
                    'This is the description of the product and it can go up to 4 lines. This is the description of the product and it can go up to 4 lines. ',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show more',
                    trimExpandedText: ' Less',
                    style: TextStyle(color: Colors.grey.shade600),
                    moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800, fontStyle: FontStyle.italic, color: dark ? TColors.white : TColors.black),
                    lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800, fontStyle: FontStyle.italic, color: dark ? TColors.white : TColors.black),
                  ),

                  /// -- Review
                  Divider(),
                  SizedBox(height: TSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TSectionHeading(title: 'Reviews (199)', showActionButton: false,),
                      IconButton(
                          onPressed: () => Get.to(() => ProductReviewScreen()),
                          icon: Icon(Iconsax.arrow_right_4, color: dark ? TColors.white : TColors.black)
                      ),
                    ],
                  ),
                  SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}




