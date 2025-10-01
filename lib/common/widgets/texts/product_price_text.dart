import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/helper/helper_functions.dart';

class TProductPriceText extends StatelessWidget {
  const TProductPriceText({
    super.key,
    this.currencySign = '\$',
    required this.price,
    this.isLarge = false,
    this.lineThrough = false,
    this.maxLines = 1,
    this.textColor,
  });

  final String currencySign, price;
  final bool isLarge, lineThrough;
  final int maxLines;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Text(
      currencySign + price,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: isLarge ?
              Theme.of(context).textTheme.headlineMedium!.apply(decoration: lineThrough ? TextDecoration.lineThrough : null, color: textColor ?? (dark ? TColors.white : TColors.black)) :
              Theme.of(context).textTheme.titleLarge!.apply(decoration: lineThrough ? TextDecoration.lineThrough : null, color: textColor ?? (dark ? TColors.white : TColors.black)),
    );
  }
}
