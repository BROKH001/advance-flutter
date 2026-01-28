import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/custom_shap/containers/circle_container.dart';
import 'package:e_commerce_app/common/widgets/success/success_screen.dart';
import 'package:e_commerce_app/features/shop/view/checkout/widgets/billing_address_section.dart';
import 'package:e_commerce_app/features/shop/view/checkout/widgets/billing_amount_section.dart';
import 'package:e_commerce_app/navigator_screen.dart';
import 'package:e_commerce_app/utils/constants/image.dart';
import 'package:e_commerce_app/utils/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/product/cart/coupon_code.dart';
import '../cart/widgets/cart_items.dart';
import 'widgets/billing_payment_section.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: SAppBar(
        title: Text('Checkout', style: Theme.of(context).textTheme.headlineSmall),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [

              /// -- Item in Cart
              TCartItems(showAddRemoveButton: false),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// -- Coupon TextField
              TCouponCode(),
              SizedBox(height: TSizes.spaceBtwItems),

              /// -- Billing Payment
              TRoundedContainer(
                showBorder: true,
                padding: EdgeInsets.all(TSizes.md),
                child: Column(
                  children: [
                    /// -- Pricing
                    TBillingAmountSection(),
                    const SizedBox(height: TSizes.spaceBtwItems),

                    /// -- Divider
                    Divider(),
                    const SizedBox(height: TSizes.spaceBtwItems),

                    /// -- Payment Method
                    TBillingPaymentSection(),
                    const SizedBox(height: TSizes.spaceBtwItems),

                    /// -- Address
                    TBillingAddressSection()
                  ],
                ),
              ),
              SizedBox(height: TSizes.spaceBtwItems),
            ],
          ),
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(top: TSizes.xs, bottom: TSizes.defaultSpace * 1.2, left: TSizes.defaultSpace, right: TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(
            () => SuccessScreen(
              image: TImage.successVerify,
              title: 'Payment Success!🎉',
              subTitle: 'Your order will be shipped soon',
              onPressed: () => Get.offAll(() => const NavigationMenu()),
            )),
          child: Text('Check Out  \$250.0')
        ),
      ),
    );
  }
}
