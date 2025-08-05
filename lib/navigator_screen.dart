import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'features/store/view/pages/account_page.dart';
import 'features/store/view/pages/cart_page.dart';
import 'features/store/view/home/homepage.dart';
import 'features/store/view/favorite/favorite_page.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  final controller = Get.put(NavigationMenuController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
      bottomNavigationBar: Obx(() =>
        NavigationBar(
          height: 80,
          elevation: 0,
          backgroundColor: Colors.white,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
          destinations: [
            NavigationDestination(icon: Icon(Iconsax.home), label: "Home"),
            NavigationDestination(icon: Icon(Iconsax.shop), label: "Service"),
            NavigationDestination(icon: Icon(Iconsax.shopping_cart), label: "Cart"),
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
    FavoritePage(),
    CartPage(),
    AccountPage()
  ];
}
