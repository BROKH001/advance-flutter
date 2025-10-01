import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';

import 'features/personalization/view/settings/settings.dart';
import 'features/shop/view/favorite/favorite_page.dart';
import 'features/shop/view/home/homepage.dart';
import 'features/shop/view/store/store.dart';
import 'utils/helper/helper_functions.dart';
import 'utils/constants/colors.dart';


class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  final controller = Get.put(NavigationMenuController());

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
      bottomNavigationBar: Obx(() =>
        NavigationBar(
          height: 80,
          elevation: 0,
          backgroundColor: dark ? TColors.darkContainer : TColors.light,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
          destinations: [
            NavigationDestination(icon: Icon(Iconsax.home), label: "Home"),
            NavigationDestination(icon: Icon(Iconsax.shop), label: "Store"),
            NavigationDestination(icon: Icon(Iconsax.heart), label: "Favorite"),
            NavigationDestination(icon: Icon(Iconsax.profile_circle4), label: "Account"),
          ],
        ),
      ),
    );
  }
}

class NavigationMenuController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    HomeStore(),
    StorePage(),
    FavoritePage(),
    SettingsScreen()
  ];
}
