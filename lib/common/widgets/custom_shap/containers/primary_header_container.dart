
import 'package:flutter/material.dart';
import '../../../../utils/constants/colors.dart';
import '../curved_edges/curve_edges_widget.dart';
import 'circle_container.dart';

class SPrimaryHeaderContainer extends StatelessWidget {
  const SPrimaryHeaderContainer({
    super.key, required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SCurvedEdgeWidget(
      child: Container(
        color: TColors.primary,
        padding: const EdgeInsets.all(0),
        child: Stack(
          children: [
            Positioned(top: -170, left: -170, child: TRoundedContainer(height: 300, width: 300, backgroundColor: TColors.accent.withOpacity(0.1), radius: 200)),
            Positioned(top: -150, right: -200, child: TRoundedContainer(height: 400, width: 400, backgroundColor: TColors.white.withOpacity(0.1), radius: 400)),
            Positioned(top: 100, right: -250, child: TRoundedContainer(height: 350, width: 350, backgroundColor: TColors.white.withOpacity(0.1), radius: 200)),
            child,
          ],
        ),
      ),
    );
  }
}
