import 'package:e_commerce_app/common/widgets/Layout/grid_layout.dart';
import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/appbar/tabbar.dart';
import 'package:e_commerce_app/common/widgets/custom_shap/containers/searchbar_container.dart';
import 'package:e_commerce_app/common/widgets/product/cart/cart_menu_icon.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/common/widgets/brands/brand_card.dart';
import 'package:e_commerce_app/features/shop/view/store/widgets/category_tab.dart';
import 'package:e_commerce_app/utils/constants/size.dart';
import 'package:e_commerce_app/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';

class StorePage extends StatelessWidget {
  const StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: SAppBar(
          title: Text('Store', style: Theme.of(context).textTheme.headlineMedium),
          actions: [SCartCounterIcon(onPressed: () {}, iconColor: TColors.darkGrey),],
        ),
      
        body: NestedScrollView(
          /// -- Header
          headerSliverBuilder: (_, innerBoxIsScroll) {
            return [
              SliverAppBar(
                pinned: true,
                floating: true,
                automaticallyImplyLeading: false,
                expandedHeight: 440,
                backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.dark : TColors.white,
      
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      SizedBox(height: TSizes.spaceBtwItems),
      
                      /// -- Search Bar
                      TSearchBarContainer(onTap: () {}, text: 'Search Product', showBorder: true, padding: EdgeInsets.zero, icon: Iconsax.search_normal),
                      SizedBox(height: TSizes.spaceBtwSections),
      
                      /// -- Featured Brands
                      TSectionHeading(title: 'Feature Brands', showActionButton: true, onPressed: () {}),
                      SizedBox(height: TSizes.spaceBtwItems),
      
                      TGridLayout(itemCount: 4, mainAxisExtent: 70, itemBuilder: (_, index) {
                        return const TBrandCard(showBorder: true);
                      }),
      
                      /// -------------- ///
                    ],
                  ),
                ),
                bottom: TTabBar(
                    tabs: [
                      Tab(child: Text('Sports')),
                      Tab(child: Text('Furniture')),
                      Tab(child: Text('Electronics')),
                      Tab(child: Text('Clothes')),
                      Tab(child: Text('Cosmetics')),
                  ]),
              ),
            ];
          },
          /// -- BODY
          body: TabBarView(
            children: [
              TCategoryTab(),
              TCategoryTab(),
              TCategoryTab(),
              TCategoryTab(),
              TCategoryTab(),
            ],
          ),
        ),
      ),
    );
  }
}



