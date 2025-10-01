import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_shap/curved_edges/curve_edges_widget.dart';
import '../../../../../common/widgets/icons/circular_icons.dart';
import '../../../../../common/widgets/images/rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image.dart';
import '../../../../../utils/constants/size.dart';
import '../../../../../utils/helper/helper_functions.dart';

class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
  final dark = THelperFunctions.isDarkMode(context);
    return SCurvedEdgeWidget(
      child: Container(
        color: dark ? TColors.darkGrey : TColors.light,
        child: Stack(
          children: [
            SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image(image: AssetImage(TImage.product1), width: double.infinity, height: 300),
              ),
            ),

            Positioned(
              bottom: 30,
              right: 0,
              left: TSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  itemCount: 6,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_, __) => SizedBox(width: TSizes.spaceBtwItems),
                  itemBuilder: (_, index) => TRoundedImage(
                    width: 80,
                    padding: EdgeInsets.all(TSizes.sm),
                    border: Border.all(color: TColors.primary),
                    backgroundColor: dark ? TColors.dark : TColors.white,
                    imageUrl: TImage.product2,
                  ),
                ),
              ),
            ),

            /// -- App Bar
            SAppBar(
              showBackArrow: true,
              actions: [TCircularIcon(onPressed: () {}, icon: Iconsax.heart5, color: Colors.red),],
            )
          ],
        ),
      ),
    );
  }
}