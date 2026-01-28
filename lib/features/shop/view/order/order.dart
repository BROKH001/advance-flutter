import 'package:e_commerce_app/features/shop/view/order/widgets/order_list_items.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/size.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SAppBar(title: Text('Orders', style: Theme.of(context).textTheme.headlineMedium), showBackArrow: true,),
      body: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),

        /// -- ORDER
        child: TOrderListItems(),
      )
    );
  }
}
