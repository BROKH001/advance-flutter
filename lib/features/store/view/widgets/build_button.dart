// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class BuildButton extends StatefulWidget {
  const BuildButton({
    super.key,
    this.title,
    this.image,
    this.backgroundColor,
    this.onTap,
  });

  final String? title;
  final String? image;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  State<BuildButton> createState() => _BuildButtonState();
}

class _BuildButtonState extends State<BuildButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        height: 78,
        width: 100,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: widget.backgroundColor ?? Colors.white,
          borderRadius: BorderRadius.circular(14),
          shape: BoxShape.rectangle,
        ),
        child: Column(
          spacing: 5,
          children: [
            SizedBox(
              height: 25,
              child: Image(
                image: AssetImage('${widget.image}'),
                filterQuality: FilterQuality.high,
                fit: BoxFit.fitHeight,
              ),
            ),
            Text(
              '${widget.title}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
