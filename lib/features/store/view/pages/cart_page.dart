import 'package:e_commerce_app/features/store/view/widgets/button_card.dart';
import 'package:e_commerce_app/features/store/view/widgets/list_card.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/size.dart';
import '../widgets/build_drawer.dart';
import '../widgets/title_appBar.dart';

class CartPage extends StatefulWidget {
  const CartPage ({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  int qty = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: BuildDrawer(),
      appBar: AppBar(
        title: TAppBar(
          title: 'Cart',
        ),
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(
                Icons.sort,
                size: TSizes.iconLg,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      primary: true,
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 8,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 15,
                ),
                child: Row(
                  spacing: 10,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Iconsax.tick_circle,
                      size: TSizes.iconLg,
                      color: Colors.lightGreen.shade700,
                    ),
                    Expanded(
                      child: Container(
                        height: 130,
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(14)
                        ),
                        child: Row(
                          spacing: 10,
                          children: [
                            Container(
                              height: 120,
                              width: 120,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),

                                // image products
                              ),
                            ),
                            Column(
                              spacing: 5,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListCard(
                                  title: "Product Name",
                                  subTitle: "Descriptions",
                                ),
                                Text('price: ${20} \$'),
                                Row(
                                  spacing: 10,
                                  children: [
                                    GestureDetector(
                                      child: Icon(Iconsax.add_circle5, color: Colors.green, size: TSizes.lg,),
                                      onTap: () {
                                        setState(() {
                                          qty ++;
                                        });
                                      },
                                    ),

                                    Text(qty.toString(), style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),),
                                    GestureDetector(
                                      child: Icon(Iconsax.minus_cirlce5, color: Colors.red, size: TSizes.lg,),
                                      onTap: () {
                                        setState(() {
                                          if (qty == 1) {
                                            qty = 1;
                                          } else if (qty>1){
                                            qty--;
                                          }
                                        });
                                      }
                                    ),
                                    SizedBox(width: 70,),
                                    GestureDetector(
                                      child: Icon(
                                        Iconsax.trash,
                                        fill: 1,
                                        shadows: [
                                          Shadow(
                                            color: Colors.redAccent,
                                            blurRadius: BorderSide.strokeAlignCenter,
                                            offset: Offset.infinite,
                                          ),
                                        ],
                                        color: Colors.red,
                                      ),
                                      onTap: () {
                                        //..........
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}