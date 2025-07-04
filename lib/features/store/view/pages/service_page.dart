import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/size.dart';
import '../widgets/build_drawer.dart';
import '../widgets/title_appBar.dart';
import 'detail_page.dart';

class ServicePage extends StatefulWidget {
  const ServicePage({super.key});

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {

  bool _isClick = false;

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
      backgroundColor: Colors.white,
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
                return GestureDetector(
                  child: Card(
                    child: Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 5,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(TSizes.borderRadiusLg),
                            border: Border.fromBorderSide(
                              BorderSide(
                                color: Colors.grey.shade200,
                                strokeAlign: BorderSide.strokeAlignOutside,
                                width: 1,
                              ),
                            ),
                            // image: DecorationImage(image: AssetImage(''))
                          ),
                        ),
                        Positioned(
                          left: 15,
                          bottom: 20,
                          child: Container(
                            width: 150,
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 10,
                            ),
                            decoration: BoxDecoration(
                                color: Colors.transparent.withOpacity(0.05),
                                borderRadius: BorderRadius.circular(8)
                            ),
                            child: Expanded(
                              flex: 1,
                              child: Text('Service',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    Get.to(() => DetailPage());
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
