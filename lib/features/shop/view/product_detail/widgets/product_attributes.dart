import 'package:e_commerce_app/common/widgets/custom_shap/containers/circle_container.dart';
import 'package:e_commerce_app/common/widgets/texts/product_price_text.dart';
import 'package:e_commerce_app/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/size.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/chips/choice_chip.dart';
import '../../../../../utils/helper/helper_functions.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        /// -- Selected Attributes Pricing and Descriptions
        TRoundedContainer(
          padding: const EdgeInsets.all(TSizes.md),
          backgroundColor: darkMode ? TColors.darkerGrey : Colors.grey.shade300,
          child: Column(
            children: [
              Row(
                children: [
                  const TSectionHeading(title: 'Variation', showActionButton: false),
                  const SizedBox(width: TSizes.spaceBtwItems),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const TProductTitle(title: 'Price : ', smallSize: true),
                          const SizedBox(width: TSizes.spaceBtwItems),
                          // -- Actual Price
                          Text(
                            '\$25',
                            style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough, color: TColors.red, decorationColor: darkMode ? TColors.white : TColors.darkerGrey),
                          ),
                          const SizedBox(width: TSizes.spaceBtwItems),

                          // -- Sale Price
                          TProductPriceText(price: '20', textColor: TColors.success, isLarge: true),
                        ],
                      ),
                      Row(
                        children: [
                          TProductTitle(title: 'Stock : ', smallSize: true),
                          const SizedBox(width: TSizes.spaceBtwItems),
                          Text('In-Stock', style: Theme.of(context).textTheme.titleSmall!.apply(color: Colors.yellow.shade600))
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              TProductTitle(
                  title: 'This is the description of the product and it can go up to 4 lines.',
                  smallSize: true,
                  maxLines: 4,
              ),
            ],
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwItems),

        /// -- Attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TSectionHeading(title: 'Color'),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(text: 'Blue', selected: false, onSelected: (value) {}),
                TChoiceChip(text: 'Yellow', selected: false, onSelected: (value) {}),
                TChoiceChip(text: 'Green', selected: true, onSelected: (value) {}),
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TSectionHeading(title: 'Size'),
            Wrap(
              spacing: 10,
              children: [
                TChoiceChip(text: 'XL', selected: false, onSelected: (value) {}),
                TChoiceChip(text: 'SM', selected: false, onSelected: (value) {}),
                TChoiceChip(text: 'L', selected: true, onSelected: (value) {}),
              ],
            ),
          ],
        ),
      ],
    );
  }
}


