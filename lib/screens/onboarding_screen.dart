import 'package:expenz/data/onboarding_data.dart';
import 'package:expenz/screens/onboarding/front_page.dart';
import 'package:expenz/screens/onboarding/shared_screen.dart';
import 'package:expenz/screens/user_data_screen.dart';
import 'package:expenz/utils/colors.dart';
import 'package:expenz/widgets/custum_button.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnboardingScreen> {
  //Page Controller

  final PageController _controller = PageController();
  bool showDetailPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                //Onboarding screens
                PageView(
                  controller: _controller,
                  onPageChanged: (index) {
                    setState(() {
                      showDetailPage = index == 3;
                    });
                  },
                  children: [
                    const FrontPage(),
                    SharedOnboardingScreen(
                      title: OnbardingData.onboardingList[0].title,
                      imagePath: OnbardingData.onboardingList[0].imagePath,
                      description: OnbardingData.onboardingList[0].description,
                    ),
                    SharedOnboardingScreen(
                      title: OnbardingData.onboardingList[1].title,
                      imagePath: OnbardingData.onboardingList[1].imagePath,
                      description: OnbardingData.onboardingList[1].description,
                    ),
                    SharedOnboardingScreen(
                      title: OnbardingData.onboardingList[2].title,
                      imagePath: OnbardingData.onboardingList[2].imagePath,
                      description: OnbardingData.onboardingList[2].description,
                    ),
                  ],
                ),
                // page dot indicators
                Container(
                  alignment: const Alignment(0, 0.7),
                  child: SmoothPageIndicator(
                    controller: _controller,
                    count: 4,
                    effect: const WormEffect(
                      activeDotColor: kMainColor,
                      dotColor: kLightGrey,
                    ),
                  ),
                ),

                // Navigation Button
                Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: !showDetailPage
                        ? GestureDetector(
                            onTap: () {
                              _controller.animateToPage(
                                _controller.page!.toInt() + 1,
                                duration: Duration(milliseconds: 400),
                                curve: Curves.easeInOut,
                              );
                            },
                            child: CustumButton(
                              buttonName: showDetailPage
                                  ? "Get Started"
                                  : "Next",
                              buttonColor: kMainColor,
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              // Navigate to the user data screen
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const UserDataScreen(),
                                ),
                              );
                            },
                            child: CustumButton(
                              buttonName: showDetailPage
                                  ? "Get Started"
                                  : "Next",
                              buttonColor: kMainColor,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
