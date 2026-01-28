import 'package:flutter/material.dart';

import '../../../../../common/widgets/product/cart/add_remove_button.dart';
import '../../../../../common/widgets/product/cart/cart_item.dart';
import '../../../../../common/widgets/texts/product_price_text.dart';
import '../../../../../utils/constants/size.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({
    super.key,
    this.showAddRemoveButton = true,
  });

  final bool showAddRemoveButton;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (_, __) => const SizedBox(height: TSizes.spaceBtwItems),
      itemCount: 2,
      shrinkWrap: true,
      itemBuilder: (_, index) => Column(
        children: [
          TCartItem(),
          // The Space Between The Product And Button
          if(showAddRemoveButton) const SizedBox(height: TSizes.spaceBtwItems / 1.5),

          // Add Remove Button And Product Price
          if(showAddRemoveButton)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(width: 80,),
                    TProductQuantityWithAddRemoveButton(),
                  ],
                ),
                TProductPriceText(price: '250'),
              ],
            ),
        ],
      ),
    );
  }
}