import 'package:e_commerce_app/features/store/view/pages/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../widgets/build_drawer.dart';
import '../../../../utils/constants/size.dart';
import '../../../../utils/helper/helper_functions.dart';

class HomeStore extends StatefulWidget {
  const HomeStore({super.key});

  @override
  State<HomeStore> createState() => _HomeStoreState();
}

class _HomeStoreState extends State<HomeStore> {

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
        title: ListTile(
          title: Text("SunHeng", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
          subtitle: Text('📌location', style:  TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
        ),
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
        padding: EdgeInsets.only(
          left: 15,
          right: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 80,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 70,
                    width: THelperFunctions.screenWidth() - 100,
                    padding: EdgeInsets.only(top: 10),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: Colors.green,
                            strokeAlign: BorderSide.strokeAlignCenter,
                          ),
                        ),
                        prefixIcon: Icon(Icons.search),
                        hintText: 'Search',
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigate to Filter Screen
                    },
                    child: Container(
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.fromBorderSide(
                              BorderSide(width: 1, strokeAlign: BorderSide.strokeAlignCenter)
                          ),
                          shape: BoxShape.rectangle
                      ),
                      child: Icon(Icons.cable),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 210,
              width: double.infinity,
              padding: EdgeInsets.all(5),
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 170,
                      padding: EdgeInsets.only(
                          left: 20
                      ),
                      decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(14)
                      ),
                      child: Column(
                        spacing: 10,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Free Consultation', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 20),),
                          Text('Get Free Support From \nour customer service.', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 40,
                              width: 100,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.green[400],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                'Call Now',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: -90,
                    child: Image(image: AssetImage('assets/images/others/card.png'), fit: BoxFit.cover, height: 200,),
                  ),
                ],
              ),
            ),
            const SizedBox(height: TSizes.defaultSpace),
            const Text(
              "Featured Products",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: TSizes.dividerHeight),
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                crossAxisSpacing: TSizes.gridViewSpacing,
                mainAxisSpacing: 8,
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
                          ),
                          child: Column(
                            spacing: 10,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: TSizes.productItemHeight - 30,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(TSizes.borderRadiusMd),
                                    topRight: Radius.circular(TSizes.borderRadiusMd),
                                  )
                                ),
                              ),
                              Text('Product Name', style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,

                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    'price: ',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    ' \$${1} ',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.green,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Positioned(
                          top: 15,
                          right: 15,
                          child: GestureDetector(
                            child: Container(
                              height: 30,
                              width: 30,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(
                                Iconsax.bookmark_21, // Use different icons
                                color: _isClick ? Colors.white : Colors.lightGreenAccent,
                                size: TSizes.iconLg,
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                _isClick = !_isClick; // Toggle the state
                              });
                            },
                          ),
                        ),
                        Positioned(
                          bottom: 15,
                          right: 15,
                          child: GestureDetector(
                            onTap: (){
                              Get.to(() => DetailPage());
                            },
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(Iconsax.add, color: Colors.white,),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    // Click on card
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
