import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/custom_shap/containers/searchbar_container.dart';
import 'package:e_commerce_app/common/widgets/product/cart/cart_menu_icon.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/utils/constants/size.dart';
import 'package:e_commerce_app/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';

class StorePage extends StatelessWidget {
  const StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SAppBar(
        title: Text('Store', style: Theme.of(context).textTheme.headlineMedium),
        actions: [SCartCounterIcon(onPressed: () {}, iconColor: TColors.dark),],
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
                    TSearchBarContainer(onTap: () {}, text: 'Search Product', showBorder: true, padding: EdgeInsets.zero, icon: Icons.search),
                    SizedBox(height: TSizes.spaceBtwSections)

                    /// --
                  ],
                ),
              ),
            ),
          ];
        },
        /// -- BODY
        body: Container(),
      ),
    );
  }
}
