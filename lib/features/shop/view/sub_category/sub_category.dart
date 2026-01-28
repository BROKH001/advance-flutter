import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/images/rounded_image.dart';
import 'package:e_commerce_app/common/widgets/product/product_cart/product_cart_horizontal.dart';
import 'package:e_commerce_app/utils/constants/image.dart';
import 'package:e_commerce_app/utils/constants/size.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/texts/section_heading.dart';

class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({
    super.key,
    this.title = 'Sub Category',
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SAppBar(title: Text(title), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Banner
              TRoundedImage(width: double.infinity, imageUrl: TImage.banner1, height: 180,),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Sub-Category
              Column(
                children: [
                  /// Heading
                  TSectionHeading(title: 'Sport-Category', showActionButton: true, onPressed: () {}),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),

                  /// Product Card Horizontal
                  SizedBox(
                    height: 124,
                    child: ListView.separated(
                        itemCount: 4,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) => const SizedBox(width: TSizes.spaceBtwItems),
                        itemBuilder: (context, index) => const TProductCartHorizontal(),
                    ),
                  ),
                ],
              ),
            ]
          ),
        ),
      ),
    );
  }
}
