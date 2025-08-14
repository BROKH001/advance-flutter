import 'package:flutter/material.dart';

import '../../../../../common/widgets/image_text_widgets/horizontal_image_text.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image.dart';

class THomeCategory extends StatelessWidget {
  const THomeCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (_, index) {
          return THorizontalImageText(
            categoryName: 'Category Name',
            imageUrl: TImage.google,
            backgroundColor: TColors.white,
            onTap: () {
              // -- Handle Navigation
            },
          );
        },
      ),
    );
  }
}