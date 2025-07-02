import 'package:e_commerce_app/utils/helper/helper_functions.dart';
import 'package:flutter/cupertino.dart';

import '../../../../utils/constants/size.dart';

class ListCard extends StatelessWidget {

  final String? title;
  final String? subTitle;
  const ListCard({super.key, this.title, this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title.toString() , style: TextStyle(fontWeight: FontWeight.bold, fontSize: TSizes.lg),),
        Text(THelperFunctions.truncateText(subTitle.toString(), 18), style: TextStyle(fontWeight: FontWeight.w400, fontSize: TSizes.md),),
      ],
    );
  }
}
