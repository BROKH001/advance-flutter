
import 'package:flutter/material.dart';

import 'brand_card.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/size.dart';
import '../../../utils/helper/helper_functions.dart';
import '../custom_shap/containers/circle_container.dart';

class TBrandShowcase extends StatelessWidget {
  const TBrandShowcase({
    super.key, required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      showBorder: true,
      borderColor: TColors.darkGrey,
      padding: const EdgeInsets.all(TSizes.md),
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      backgroundColor: Colors.transparent,
      child: Column(
        children: [
          /// Brand with Product Count
          const TBrandCard(showBorder: false,),

          Row(
            children: images.map((image) => brandTopBrandProductWidget(image, context)).toList(),
          ),
        ],
      ),
    );
  }

  Widget brandTopBrandProductWidget(String image, context) {
    return Expanded(
      child: TRoundedContainer(
        height: 100,
        margin: const EdgeInsets.only(right: TSizes.sm),
        padding: const EdgeInsets.all(TSizes.md),
        backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.darkerGrey : TColors.light,
        child: Image(fit: BoxFit.contain, image: AssetImage(image)),
      ),
    );
  }
}