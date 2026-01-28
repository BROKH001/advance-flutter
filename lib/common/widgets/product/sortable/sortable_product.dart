import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/Layout/grid_layout.dart';
import '../../../../common/widgets/product/product_cart/product_cart_vertical.dart';
import '../../../../utils/constants/size.dart';

class TSortableProduct extends StatelessWidget {
  const TSortableProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Dropdown
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          onChanged: (value) {},
          items: ['Name', 'High Price', 'Low Price', 'Newest', 'Sale', 'Popularity']
              .map((option) =>
              DropdownMenuItem(
                value: option,
                child: Text(option),
              ),
          ).toList(),
        ),
        const SizedBox(height: TSizes.spaceBtwSections),

        /// Grid of Product
        TGridLayout(itemCount: 6, itemBuilder: (_, index) => TProductCartVertical()),

      ],
    );
  }
}
