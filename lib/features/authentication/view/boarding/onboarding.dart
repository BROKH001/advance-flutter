import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/image.dart';
import '../../../../utils/constants/text_string.dart';
import '../../controllers/onboarding/onboarding_controller.dart';
import 'widgets/on_boarding_button.dart';
import 'widgets/on_boarding_dotNavigation.dart';
import 'widgets/on_boarding_nextButton.dart';
import 'widgets/on_boarding_page.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          /// Horizontal Scrollable Pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                title: TTexts.onBoardingTitle1,
                image: TImage.onBoardingImage1,
                subTitle: TTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                title: TTexts.onBoardingTitle2,
                image: TImage.onBoardingImage2,
                subTitle: TTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                title: TTexts.onBoardingTitle3,
                image: TImage.onBoardingImage3,
                subTitle: TTexts.onBoardingSubTitle3,
              ),
            ],
          ),

          /// Skip Action
          const OnBoardingSkipButton(),

          /// Dot Navigation SmoothPageIndicator
          const OnBoardingDotNavigation(),

          /// Circular Button
          const OnBoardingNextButton(),
        ],
      ),
    );
  }
}
