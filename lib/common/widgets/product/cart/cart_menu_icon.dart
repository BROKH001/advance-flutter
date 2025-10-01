
import 'package:e_commerce_app/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../features/shop/view/cart/cart.dart';
import '../../../../utils/constants/colors.dart';

class SCartCounterIcon extends StatelessWidget {
  const SCartCounterIcon({
    super.key,
    this.onPressed,
    required this.iconColor,
    this.counterBgColor,
    this.counterTextColor,
  });

  final VoidCallback? onPressed;
  final Color? iconColor, counterBgColor, counterTextColor;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Stack(
      children: [
        IconButton(onPressed: () => Get.to(() => const CartScreen()), icon: Icon(Iconsax.shopping_cart), color: iconColor),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: counterBgColor ?? (dark ? TColors.red : TColors.red),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Text('1', style: Theme.of(context).textTheme.bodyLarge!.apply(color: counterTextColor ?? (dark ? TColors.white : TColors.white))),
            ),
          ),
        )
      ],
    );
  }
}