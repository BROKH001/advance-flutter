import 'package:e_commerce_app/common/style/shadow.dart';
import 'package:e_commerce_app/common/widgets/custom_shap/containers/circle_container.dart';
import 'package:e_commerce_app/common/widgets/images/rounded_image.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../features/shop/view/product_detail/product_detail_screen.dart';
import '../../../../utils/constants/image.dart';
import '../../../../utils/constants/size.dart';
import '../../icons/circular_icons.dart';
import '../../texts/product_title_text.dart';

class TProductCartVertical extends StatelessWidget {
  const TProductCartVertical({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () => Get.to(const TProductDetailScreen()),
      child: Container(
        width: 180,
        padding: EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [TShadow.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.dark : TColors.light,
        ),
        child: Column(
          children: [
            TRoundedContainer(
              height: 180,
              padding: EdgeInsets.all(TSizes.md),
              backgroundColor: dark ? TColors.darkerGrey : TColors.white,
              child: Stack(
                children: [
                  TRoundedImage(imageUrl: TImage.product1, applyImageRadius: true, backgroundColor: dark ? Colors.transparent : TColors.white),

                  // -- Discount Text
                  Positioned(
                    top: 12,
                      child: TRoundedContainer(
                        padding: EdgeInsets.symmetric(horizontal: TSizes.sm, vertical: TSizes.xs),
                        backgroundColor: TColors.secondary,
                        child: Text('25 %', style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black)),
                      ),
                  ),

                  // -- Favorite Icon
                  Positioned(top: 0, right: 0, child: TCircularIcon(icon: Iconsax.heart5, size: TSizes.iconMd, color: TColors.red, onPressed: () {})),
                ],
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 2),

            // -- Detail Text
            Padding(
              padding: EdgeInsets.only(left: TSizes.sm),
              child: Column(
                children: [
                  TProductTitle(title: 'Green Nike Air Shoes',),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  // -- Brand Name
                  Row(
                    children: [
                      Text('Nike',overflow: TextOverflow.ellipsis, maxLines: 1, style: Theme.of(context).textTheme.labelMedium) ,
                      const SizedBox(width: TSizes.xs),
                      const Icon(Iconsax.verify5, size: TSizes.iconSm, color: TColors.primary,)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Product Price
                      Text('\$ 25.5', style: Theme.of(context).textTheme.headlineMedium, maxLines: 1, overflow: TextOverflow.ellipsis),
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
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



