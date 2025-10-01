
import 'package:flutter/material.dart';

import '../custom_shap/containers/circle_container.dart';
import '../images/circular_image.dart';
import '../texts/t_brand_title_with_verified_icon.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/enum.dart';
import '../../../utils/constants/image.dart';
import '../../../utils/constants/size.dart';
import '../../../utils/helper/helper_functions.dart';

class TBrandCard extends StatelessWidget {
  const TBrandCard({
    super.key,
    required this.showBorder,
    this.onTap,
  });

  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: TRoundedContainer(
        padding: const EdgeInsets.all(TSizes.sm),
        backgroundColor: Colors.transparent,
        showBorder: showBorder,
        child: Row(
          children: [
            /// -- Icon
            Flexible(
              child: TCircularImage(
                image: TImage.github,
                isNetworkImage: false,
                backgroundColor: Colors.transparent,
                overlayColor: THelperFunctions.isDarkMode(context) ? TColors.white : TColors.black,
              ),
            ),
            /// [Title -- SubTitle]
            const SizedBox(width: TSizes.spaceBtwItems / 2,),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TBrandTitleWithVerifiedIcon(title: 'Nike', brandTextSize: TextSizes.large),
                  Text(
                    '256 Products',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            ),
            ///
          ],
        ),
      ),
    );
  }
}

