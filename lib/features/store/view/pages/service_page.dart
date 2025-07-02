import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/size.dart';
import '../../../../utils/helper/helper_functions.dart';
import '../widgets/build_drawer.dart';
import '../widgets/title_appBar.dart';

class ServicePage extends StatelessWidget {
  const ServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: BuildDrawer(),
      appBar:  _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: TAppBar(
        title: 'Service'
      ),
      centerTitle: true,
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
            Icons.notifications_none_rounded,
            size: TSizes.iconLg,
          ),
          onPressed: () {},
        ),
        const SizedBox(width: TSizes.spaceBtwItems),
      ],
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      primary: true,
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                crossAxisSpacing: TSizes.gridViewSpacing,
                mainAxisSpacing: TSizes.gridViewSpacing,
              ),
              itemCount: 10,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.orangeAccent[200],
                  child: Container(
                    color: Colors.transparent,
                    child: Center(
                      child: Text(
                        "Product ${index + 1}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: TSizes.defaultSpace),
          ],
        ),
      ),
    );
  }
}
