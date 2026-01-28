import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/features/shop/brand/brand_product.dart';
import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/widgets/Layout/grid_layout.dart';
import '../../../common/widgets/brands/brand_card.dart';
import '../../../utils/constants/size.dart';

class AllBrandScreen extends StatelessWidget {
  const AllBrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SAppBar(title: Text('Brand'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// -- Heading
              TSectionHeading(title: "Popular Brand", showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),

              /// -- Gridview Brand
              TGridLayout(
                itemCount: 6,
                mainAxisExtent: 80,
                itemBuilder: (_, index) => TBrandCard(
                  showBorder: true,
                  onTap: () => Get.to(() => BrandProduct()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
