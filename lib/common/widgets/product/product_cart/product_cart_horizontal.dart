import 'package:e_commerce_app/common/widgets/custom_shap/containers/circle_container.dart';
import 'package:e_commerce_app/common/widgets/images/rounded_image.dart';
import 'package:e_commerce_app/common/widgets/texts/product_price_text.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/image.dart';
import 'package:e_commerce_app/utils/constants/size.dart';
import 'package:e_commerce_app/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../icons/circular_icons.dart';
import '../../texts/product_title_text.dart';
import '../../texts/t_brand_title_with_verified_icon.dart';

class TProductCartHorizontal extends StatelessWidget {
  const TProductCartHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      width: 320,
      alignment: Alignment.center,
      padding: EdgeInsets.all(1.5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(TSizes.productImageRadius),
        color: dark ? TColors.dark : TColors.lightContainer,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              /// -- Product Picture
              TRoundedContainer(
                height: 120,
                padding: EdgeInsets.all(TSizes.sm),
                backgroundColor: dark ? TColors.darkerGrey : TColors.white,
                child: Stack(
                  children: [
                    /// Product Picture
                    SizedBox(
                      width: 120,
                      height: 120,
                      child: TRoundedImage(imageUrl: TImage.product1, applyImageRadius: true),
                    ),

                    /// Discount
                    Positioned(
                      top: 10,
                      child: TRoundedContainer(
                        padding: EdgeInsets.symmetric(horizontal: TSizes.sm, vertical: TSizes.xs),
                        backgroundColor: TColors.secondary,
                        child: Text('25 %', style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black)),
                      ),
                    ),

                    /// Add to Favorite Products
                    Positioned(top: 0, right: 0, child: TCircularIcon(icon: Iconsax.heart5, color: TColors.red, size: TSizes.iconMd, onPressed: () {})),
                  ],
                ),
              ),

              /// -- Description
              SizedBox(
                width: 175,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: TSizes.sm),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: TSizes.spaceBtwItems / 2,
                        children: [
                          // -- Brand Name
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TProductTitle(title: 'Green Nike Air Sleeves Shirt', smallSize: true, maxLines: 2),
                              const SizedBox(height: TSizes.spaceBtwItems / 2),
                              TBrandTitleWithVerifiedIcon(title: 'Nike'),
                            ],
                          ),

                          // -- Price and Add to Cart
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              /// -- Price
                              Expanded(child: TProductPriceText(price: ' 250.0')),

                              /// -- Add to cart
                              Container(
                                decoration: BoxDecoration(
                                    color: dark ? TColors.success : TColors.primary,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(TSizes.cardRadiusMd),
                                      bottomRight: Radius.circular(TSizes.cardRadiusMd),
                                    )
                                ),
                                child: SizedBox(
                                  height: TSizes.iconLg * 1.2,
                                  width: TSizes.iconLg * 1.2,
                                  child: Center(child: IconButton(onPressed: () {}, icon: Icon(Iconsax.add, color: dark ? TColors.white : TColors.white))),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
