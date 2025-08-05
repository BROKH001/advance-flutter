import 'package:flutter/material.dart';

import 'package:e_commerce_app/features/store/view/home/widgets/home_category.dart';
import 'package:e_commerce_app/features/store/view/home/widgets/promo_slider.dart';
import 'package:e_commerce_app/features/store/view/home/widgets/home_appbar.dart';
import 'package:e_commerce_app/utils/constants/image.dart';
import 'package:e_commerce_app/utils/constants/size.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/Layout/grid_layout.dart';
import '../../../../common/widgets/custom_shap/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shap/containers/searchbar_container.dart';
import '../../../../common/widgets/product/product_cart/product_cart_horizontal.dart';
import '../../../../common/widgets/product/product_cart/product_cart_vertical.dart';
import '../../../../common/widgets/texts/section_heading.dart';


class HomeStore extends StatelessWidget {
  const HomeStore({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// --- AppBar
                  SHomeAppBar(),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  /// --- Searchbar
                  TSearchBarContainer(text: 'Search Product', icon: Iconsax.search_normal, onTap: () {}),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  /// --- Categories Product
                  Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace, right: 12),
                    child: Column(
                      children: [
                        /// -- Heading
                        TSectionHeading(title: 'Popular Categories', showActionButton: true, textColor: Colors.white, onPressed: () {},),
                        const SizedBox(height: TSizes.spaceBtwItems),

                        /// -- Categories
                        THomeCategory(),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            /// -- Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  TPromoSlider(banners: [TImage.banner1, TImage.banner2, TImage.banner3]),

                  /// -- GridView Products
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  TGridLayout(itemCount: 4,itemBuilder: (context, index) => const TProductCartVertical()),

                  /// -- Product Horizontal
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  const TProductCartHorizontal(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}






