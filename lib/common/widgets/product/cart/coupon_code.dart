import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/size.dart';
import '../../../../utils/helper/helper_functions.dart';
import '../../custom_shap/containers/circle_container.dart';

class TCouponCode extends StatelessWidget {
  const TCouponCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TRoundedContainer(
      showBorder: true,
      backgroundColor: dark ? TColors.dark : TColors.white,
      padding: EdgeInsets.only(top: TSizes.sm, bottom: TSizes.sm, right: TSizes.sm, left: TSizes.md),
      child: Row(
        children: [

          /// -- Coupon TextField
          Flexible(
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Have a promo code? Enter here',
                  disabledBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  border: InputBorder.none,
                ),
              )
          ),

          /// -- Apply Button
          SizedBox(
            width: 80,
            child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    foregroundColor: dark ? Colors.white : TColors.darkerGrey,
                    backgroundColor: Colors.grey.shade300,
                    side: BorderSide(color: Colors.grey.shade50)
                ),
                child: Text('Apply')
            ),
          )
        ],
      ),
    );
  }
}
