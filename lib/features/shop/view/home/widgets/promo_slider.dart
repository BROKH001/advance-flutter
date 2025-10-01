import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/custom_shap/containers/circle_container.dart';
import '../../../../../common/widgets/images/rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/size.dart';
import '../../../controller/home_controller.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key, required this.banners,

  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(HomeController());

    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              viewportFraction: 1,
              onPageChanged: (index, _) => controller.updatePageIndicator(index),
            ),
            items: banners.map((url) => TRoundedImage(imageUrl: url)).toList()
          ),
          const SizedBox(height: TSizes.spaceBtwItems),
          Center(
            child: Obx(
              () => Row(
                spacing: 10,
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (int i = 0; i < banners.length; i++) TRoundedContainer(height: 4, width: 20, backgroundColor: controller.carouselCurrentIndex.value == i ? TColors.primary : TColors.grey),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}