import 'package:e_commerce_app/utils/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../checkout/checkout.dart';
import 'widgets/cart_items.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SAppBar(title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall), showBackArrow: true),
      body: Padding(padding: const EdgeInsets.all(TSizes.defaultSpace), child: TCartItems()),
      
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(top: TSizes.xs, bottom: TSizes.defaultSpace * 1.2, left: TSizes.defaultSpace, right: TSizes.defaultSpace),
        child: ElevatedButton(onPressed: () => Get.to(() => CheckoutScreen()), child: Text('Check Out  \$250.0')),
      ),
    );
  }
}


