import 'package:e_commerce_app/common/widgets/brands/brand_card.dart';
import 'package:e_commerce_app/common/widgets/product/sortable/sortable_product.dart';
import 'package:e_commerce_app/utils/constants/size.dart';
import 'package:flutter/material.dart';

import '../../../common/widgets/appbar/appbar.dart';

class BrandProduct extends StatelessWidget {
  const BrandProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SAppBar(title: Text('Nike'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// -- Heading
              TBrandCard(showBorder: true),
              const SizedBox(height: TSizes.defaultSpace),

              /// -- Sortable Brand
              TSortableProduct(),
            ],
          ),
        ),
      ),
    );
  }
}
