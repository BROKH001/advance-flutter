
import 'package:e_commerce_app/common/widgets/list_tile/setting_menu_tile.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/features/shop/view/cart/cart.dart';
import 'package:e_commerce_app/features/shop/view/order/order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/custom_shap/containers/primary_header_container.dart';
import '../../../../common/widgets/list_tile/user_profile_title.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/size.dart';
import '../address/address.dart';
import '../profile/profile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// HEADING
            SPrimaryHeaderContainer(
              child: Column(
                children: [
                  SAppBar(title: Text('Account', style: Theme.of(context).textTheme.headlineMedium!.apply(color: TColors.white))),

                  TUserProfileTitle(onPressed: () => Get.to(const ProfileScreen())),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),
            /// BODY
            Padding(
              padding: EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  /// --Account Settings
                  TSectionHeading(title: 'Account Settings', showActionButton: true, onPressed: () {}),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  TSettingMenuTile(icon: Iconsax.safe_home, title: "My Address", subTitle: 'Set, shopping delivery address', onTap: () => Get.to(() => const UserAddressScreen())),
                  TSettingMenuTile(icon: Iconsax.shopping_cart, title: "My Carts", subTitle: 'Add, remove product and move to checkout', onTap: () => Get.to(() => const CartScreen())),
                  TSettingMenuTile(icon: Iconsax.bag_tick, title: "My Orders", subTitle: 'In-progress, completed, and canceled orders', onTap: () => Get.to(() => const OrderScreen())),
                  TSettingMenuTile(icon: Iconsax.bank, title: "Bank Account", subTitle: 'Withdraw and registered bank account', onTap: () {}),
                  TSettingMenuTile(icon: Iconsax.discount_shape, title: "My Coupons", subTitle: 'List of all the discounts coupons', onTap: () {}),
                  TSettingMenuTile(icon: Iconsax.notification, title: "Notifications", subTitle: 'Set any kind of notification messages', onTap: () {}),
                  TSettingMenuTile(icon: Iconsax.security_card, title: "Account Privacy", subTitle: 'Manage data usage and connect account', onTap: () {}),

                  /// --App Settings
                  const SizedBox(height: TSizes.spaceBtwSections),
                  TSectionHeading(title: 'App Settings'),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  TSettingMenuTile(icon: Iconsax.document_upload, title: "Load Data", subTitle: 'Upload Data to your Cloud Firebase', onTap: () {}),
                  TSettingMenuTile(icon: Iconsax.location, title: "Geolocation", subTitle: 'Set recommendation based on your location', trailing: Switch(value: true, onChanged: (value) {})),
                  TSettingMenuTile(icon: Iconsax.security_user, title: "Safe Mode", subTitle: 'Search results are safe for all ages', trailing: Switch(value: false, onChanged: (value) {})),
                  TSettingMenuTile(icon: Iconsax.image, title: "HD Image Quality", subTitle: 'Set Image Quality to be seen', trailing: Switch(value: false, onChanged: (value) {})),

                  /// --Logout Button
                  const SizedBox(height: TSizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(onPressed: () {}, child: Text('Logout')),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections * 2.5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


