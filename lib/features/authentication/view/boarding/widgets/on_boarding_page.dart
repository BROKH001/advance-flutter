import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../../../../utils/constants/size.dart';
import '../../../../../utils/helper/helper_functions.dart';

class OnBoardingPage extends StatelessWidget {
  final String title, image, subTitle;
  const OnBoardingPage({
    super.key,
    required this.title,
    required this.image,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: AnimationLimiter(
        child: Column(
          children: AnimationConfiguration.toStaggeredList(
            duration: const Duration(milliseconds: 900),
            childAnimationBuilder: (widget) => SlideAnimation(
              horizontalOffset: 100.0,
              child: FadeInAnimation(
                child: widget,
              ),
            ),
            children: [
              Image(
                width: THelperFunctions.screenWidth() * 0.5,
                height: THelperFunctions.screenHeight() * 0.6,
                image: AssetImage(image),
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              Text(
                subTitle,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}