import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'add_new_address.dart';
import 'widgets/single_address.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SAppBar(
        title: Text('Address', style: Theme.of(context).textTheme.headlineSmall),
        showBackArrow: true,
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: TColors.primary,
        onPressed: () => Get.to(() => const AddNewAddressScreen()),
        child: const Icon(Icons.add),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            spacing: TSizes.spaceBtwItems,
            children: [
              TSingleAddress(isSelected: false),
              TSingleAddress(isSelected: false),
              TSingleAddress(isSelected: true),
              TSingleAddress(isSelected: false),
              TSingleAddress(isSelected: false),
              TSingleAddress(isSelected: false),
              TSingleAddress(isSelected: false),
            ],
          ),
        ),
      ),
    );
  }
}
