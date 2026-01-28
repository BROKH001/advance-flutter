import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/custom_shap/containers/circle_container.dart';
import '../../../../../utils/constants/size.dart';
import '../../../../../utils/helper/helper_functions.dart';

class TOrderListItems extends StatelessWidget {
  const TOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) => const SizedBox(height: TSizes.spaceBtwItems),
      itemCount: 8,
      itemBuilder: (_, index) => TRoundedContainer(
        padding: EdgeInsets.all(TSizes.md),
        backgroundColor: dark ? TColors.dark : TColors.light,
        showBorder: true,
        child: Column(
          children: [
            /// -- ROW
            Row(
              children: [
                ///  1 - Icon
                Icon(Iconsax.ship),
                const SizedBox(width: TSizes.spaceBtwItems / 2),

                /// 2 - Status Date
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Processing', style: Theme.of(context).textTheme.bodyLarge!.apply(color: TColors.primary, fontWeightDelta: 1),),
                      Text('01 Sep 2025', style: Theme.of(context).textTheme.headlineSmall,)
                    ],
                  ),
                ),
                Spacer(),
                IconButton(onPressed: () {}, icon: Icon(Iconsax.arrow_right_34, size: TSizes.iconSm,))
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwItems),

            /// -- Order
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      ///  1 - Icon
                      Icon(Iconsax.tag),
                      const SizedBox(width: TSizes.spaceBtwItems / 2),

                      /// 2 - Order Code
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Order', style: Theme.of(context).textTheme.bodySmall),
                            Text('CWT0015', style: Theme.of(context).textTheme.headlineSmall)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                /// -- Shipping Date
                Expanded(
                  child: Row(
                    children: [
                      ///  1 - Icon
                      Icon(Iconsax.calendar),
                      const SizedBox(width: TSizes.spaceBtwItems / 2),

                      /// 2 - Shipping Date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Shipping Date', style: Theme.of(context).textTheme.bodySmall),
                            Text('08 Sep 2025', style: Theme.of(context).textTheme.headlineSmall)
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
      ),
    );
  }
}
