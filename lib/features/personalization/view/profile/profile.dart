import 'package:flutter/material.dart';

import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/images/circular_image.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/utils/helper/helper_functions.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/image.dart';
import 'package:e_commerce_app/utils/constants/size.dart';
import 'package:iconsax/iconsax.dart';

import 'widgets/profile_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SAppBar(
        showBackArrow: true,
        title: Text('Profile', style: Theme.of(context).textTheme.headlineMedium),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      TCircularImage(
                        image: TImage.userProfile,
                        height: 80,
                        width: 80,
                        backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.light : TColors.grey,
                      ),
                      TextButton(onPressed: () {}, child: Text('Change Profile Picture')),
                    ],
                  ),
                ),

                const SizedBox(height: TSizes.spaceBtwItems / 2),
                const Divider(),
                const SizedBox(height: TSizes.spaceBtwItems),

                /// -- Personal Information
                const TSectionHeading(title: 'Personal Information', showActionButton: false,),
                const SizedBox(height: TSizes.spaceBtwItems),

                TProfileMenu(title: 'name', value: 'SunHengBroKH', onTap: () {}),
                TProfileMenu(title: 'username', value: 'SunHeng270405', onTap: () {}),

                const SizedBox(height: TSizes.spaceBtwItems),
                const Divider(),
                const SizedBox(height: TSizes.spaceBtwItems),

                /// -- Profile Information
                const TSectionHeading(title: 'Profile Information', showActionButton: false,),
                const SizedBox(height: TSizes.spaceBtwItems),

                TProfileMenu(title: 'User ID', value: '123456',icon: Iconsax.copy, onTap: () {}),
                TProfileMenu(title: 'E-mail', value: 'brokh270405@gmail.com', onTap: () {}),
                TProfileMenu(title: 'Phone number', value: '+855 123 456 789', onTap: () {}),
                TProfileMenu(title: 'Gender', value: 'Male', onTap: () {}),
                TProfileMenu(title: 'Date of Birth', value: '27 Apr, 2005', onTap: () {}),

                const SizedBox(height: TSizes.spaceBtwItems),
                const Divider(),
                const SizedBox(height: TSizes.spaceBtwItems),

                Center(
                  child: TextButton(onPressed: () {}, child: Text('Delete Account', style: TextStyle(color: Colors.red),)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


