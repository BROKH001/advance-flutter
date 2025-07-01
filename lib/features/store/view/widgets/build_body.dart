// import 'package:e_commerce_app/utils/constants/enum.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/size.dart';
import '../../../../utils/helper/helper_functions.dart';

class BuildBody extends StatefulWidget {
  const BuildBody({super.key});

  @override
  State<BuildBody> createState() => _BuildBodyState();
}

class _BuildBodyState extends State<BuildBody> {
  @override
  Widget build(BuildContext context) {
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
                    onTap: () {},
                    child: Container(
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                          color: Colors.greenAccent.withOpacity(0.3),
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
                        color: Colors.green.withOpacity(0.3),
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
            const Text(
              "Welcome to the Store",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Container(
              color: Colors.transparent,
              height: 200,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Card(
                    child: Container(
                      width: 150,
                      height: 200,
                      color: Colors.indigoAccent[100],
                      child: Center(
                        child: Text(
                          "Item $index",
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: TSizes.defaultSpace),
            const Text(
              "Categories",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: TSizes.dividerHeight),
            Container(
              color: Colors.transparent,
              height: 60,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.greenAccent[200],
                    child: Container(
                      width: MediaQuery.of(context).size.width / 3,
                      color: Colors.transparent,
                      child: Center(
                        child: Text(
                          "Category ${index + 1}",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  );
                },
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
                childAspectRatio: 0.7,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
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
