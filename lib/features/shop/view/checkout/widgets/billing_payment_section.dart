import 'package:e_commerce_app/utils/constants/size.dart';
import 'package:e_commerce_app/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/custom_shap/containers/circle_container.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image.dart';

class TBillingPaymentSection extends StatelessWidget {
  const TBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        TSectionHeading(title: 'Payment Method', buttonTitle: 'Change', onPressed: () {}),
        const SizedBox(height: TSizes.spaceBtwItems / 2),

        Row(
          children: [
            TRoundedContainer(
              height: 35,
              width: 60,
              backgroundColor: dark ? TColors.light : TColors.white,
              child: Image(image: AssetImage(TImage.paypal), fit: BoxFit.cover),
            ),
            const SizedBox(width: TSizes.spaceBtwItems / 2),
            Text('Paypal', style: Theme.of(context).textTheme.bodyLarge!.apply(color: Colors.indigo))
          ],
        ),
      ],
    );
  }
}
