import 'package:flutter/material.dart';
import '../constants/body_width.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileBody;
  final Widget tabletBody;
  final Widget desktopBody;

  const ResponsiveLayout({
    super.key,
    required this.mobileBody,
    required this.tabletBody,
    required this.desktopBody,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth <= mobileWidth) {
        return mobileBody;
      } else if (constraints.maxWidth <= tabletWidth) {
        return tabletBody;
      } else {
        return desktopBody;
      }
    });
  }
}
