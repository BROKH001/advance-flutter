import 'package:e_commerce_app/utils/constants/constants_app.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/size.dart';
import '../widgets/build_body.dart';
import '../widgets/build_drawer.dart';

class HomeStore extends StatefulWidget {
  const HomeStore({super.key});

  @override
  State<HomeStore> createState() => _HomeStoreState();
}

class _HomeStoreState extends State<HomeStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: BuildDrawer(),
      appBar:  _buildAppBar(),
      body: BuildBody(),
    );
  }

  AppBar _buildAppBar() {
      return AppBar(
        title: const Text("Home", style: TextStyle(fontSize: 25)),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.sort, size: TSizes.iconLg),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              focusColor: Colors.grey,
              autofocus: true,
              disabledColor: Colors.grey,
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.shopify_outlined,
              size: TSizes.iconLg,
            ),
            onPressed: () {},
          ),
          const SizedBox(width: TSizes.spaceBtwItems),
        ],
      );
    }
}
