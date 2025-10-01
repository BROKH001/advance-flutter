
import 'package:flutter/material.dart';

import '../../../../../common/widgets/Layout/grid_layout.dart';
import '../../../../../common/widgets/brands/brand_show_case.dart';
import '../../../../../common/widgets/product/product_cart/product_cart_vertical.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/image.dart';
import '../../../../../utils/constants/size.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// -- Featured Brands With Top Products
              TBrandShowcase(images: [TImage.product1, TImage.product2, TImage.product1],),
              const SizedBox(height: TSizes.spaceBtwItems),

              /// -- GridView Products
              TSectionHeading(title: 'Popular Products', showActionButton: true, onPressed: () {}),
              TGridLayout(itemCount: 4, itemBuilder: (context, index) => const TProductCartVertical()),
            ],
          ),
        ),
      ],
    );
  }
}
