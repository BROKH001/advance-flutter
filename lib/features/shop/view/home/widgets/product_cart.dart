import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../utils/constants/size.dart';

class SProductCart extends StatelessWidget {
  const SProductCart({super.key, required this.images});

  final List<String> images;
  final bool _isClick = false;
  final bool _isBookmark = false;


  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
        crossAxisSpacing: TSizes.gridViewSpacing,
        mainAxisSpacing: 8,
      ),
      itemCount: images.length,
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
                    borderRadius: BorderRadius.circular(
                      TSizes.borderRadiusLg,
                    ),
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
                            topLeft: Radius.circular(
                              TSizes.borderRadiusMd,
                            ),
                            topRight: Radius.circular(
                              TSizes.borderRadiusMd,
                            ),
                          ),
                          image: DecorationImage(
                            image: AssetImage(images[index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(
                        'Product Name',
                        style: TextStyle(
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
                      ),
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
                        color:
                        _isBookmark
                            ? Colors.white
                            : Colors.lightGreenAccent,
                        size: TSizes.iconLg,
                      ),
                    ),
                    onTap: () {

                    },
                  ),
                ),
                Positioned(
                  bottom: 15,
                  right: 15,
                  child: GestureDetector(
                    onTap: () {

                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(Iconsax.add, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          onTap: () {

          },
        );
      },
    );
  }
}
