import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/custom_shap/containers/circle_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/size.dart';
import '../../../../../utils/helper/helper_functions.dart';

class TSingleAddress extends StatelessWidget {
  const TSingleAddress({
    super.key,
    required this.isSelected,
  });

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TRoundedContainer(
      width: double.infinity,
      padding: EdgeInsets.all(TSizes.md),
      backgroundColor: isSelected ? Colors.indigoAccent.shade200 : Colors
          .transparent,
      borderColor: isSelected ? Colors.transparent
          : dark
          ? TColors.darkerGrey
          : TColors.grey,
      showBorder: true,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 5,
            child: Icon(
              isSelected ? Iconsax.tick_circle5 : null,
              color: isSelected
                        ? dark
                            ? TColors.light
                            : TColors.dark
                        : null,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Sun BroKH', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: TSizes.sm / 2),
              Text('(+855) 93897000', style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: TSizes.sm / 2),
              Text('street 8, K\'nong, Preak Ta Mak, Kandal, Cambodia', style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
        ],
      ),
    );
  }
}