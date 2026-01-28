import 'package:flutter/material.dart';

import '../../../utils/constants/size.dart';

class TRoundedImage extends StatelessWidget {
  const TRoundedImage({
    super.key,
    required this.imageUrl,
    this.padding,
    this.border,
    this.onPressed,
    this.height = 150,
    this.width = double.infinity,
    this.borderRadius = TSizes.md,
    this.applyImageRadius = true,
    this.isNetworkImage = false,
    this.fit = BoxFit.cover,
    this.backgroundColor = Colors.transparent,
  });

  final String imageUrl;
  final double height, width;
  final double borderRadius;
  final bool applyImageRadius;
  final bool isNetworkImage;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final BoxBorder? border;
  final Color backgroundColor;
  final VoidCallback? onPressed;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        padding: padding,
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(borderRadius),
            border: border
        ),
        child: ClipRRect(
          borderRadius: applyImageRadius ? BorderRadius.circular(borderRadius) : BorderRadius.zero,
          child: Image(image: isNetworkImage ? NetworkImage(imageUrl) : AssetImage(imageUrl) as ImageProvider, fit: fit),
        ),
      ),
    );
  }
}