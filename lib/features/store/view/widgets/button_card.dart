import 'package:e_commerce_app/utils/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ButtonCard extends StatefulWidget {
  final int? qty;
  final void Function()? onTap;
  const ButtonCard({super.key, required this.qty, this.onTap});

  @override
  State<ButtonCard> createState() => _ButtonCardState();
}
class _ButtonCardState extends State<ButtonCard> {

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        GestureDetector(
          onTap: widget.onTap!,
          child: Icon(Iconsax.add_circle5, color: Colors.green, size: TSizes.lg,),
        ),
        Text('${widget.qty}', style: TextStyle(
          fontWeight: FontWeight.bold,
        ),),
        GestureDetector(
          onTap: widget.onTap!,
          child: Icon(Iconsax.minus_cirlce5, color: Colors.red, size: TSizes.lg,),
        ),
      ],
    );
  }
}
