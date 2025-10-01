import 'package:flutter/material.dart';
import 'package:e_commerce_app/utils/devices/device.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/helper/helper_functions.dart';

class TTabBar extends StatelessWidget implements PreferredSizeWidget {
  const TTabBar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Material(
      color: dark ? TColors.black : TColors.light,
      child: TabBar(
          tabs: tabs,
          isScrollable: true,
          indicatorColor: TColors.primary,
          tabAlignment: TabAlignment.start,
          unselectedLabelColor: Colors.grey,
          padding: EdgeInsets.only(left: 10),
          labelColor: dark ? TColors.white : TColors.primary,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
