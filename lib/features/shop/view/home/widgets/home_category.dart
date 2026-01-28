import 'package:e_commerce_app/features/shop/view/sub_category/sub_category.dart';
import 'package:e_commerce_app/utils/constants/icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/image_text_widgets/horizontal_image_text.dart';
import '../../../../../utils/constants/colors.dart';

class THomeCategory extends StatelessWidget {
  const THomeCategory({
    super.key,
  });


  @override
  Widget build(BuildContext context) {

    final Map<String, List> category = {
      'Category Name' : ['Clothes', 'Shoes', 'Animals', 'Sports', 'Electronics', 'Furniture'],
      'Image Url' : [TIcons.clothes, TIcons.shoes, TIcons.animals, TIcons.sports, TIcons.electronics, TIcons.furniture]
    };

    final trust = category['Category Name']!.length == category['Image Url']!.length;



    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: trust ? category['Category Name']!.length : 0,
        itemBuilder: (_, index) {
          return THorizontalImageText(
            categoryName: category['Category Name']![index],
            imageUrl: category['Image Url']![index],
            backgroundColor: TColors.white,
            onTap: () => Get.to(() => SubCategoryScreen())
          );
        },
      ),
    );
  }
}