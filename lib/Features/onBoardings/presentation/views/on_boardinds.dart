import 'dart:async';
import 'package:flutter/material.dart';
import 'package:store_powered_ai/Features/authentication/presentation/views/login_view.dart';
import 'package:store_powered_ai/Features/get_started/prersentation/views/get_started_view.dart';
import 'package:store_powered_ai/Features/onBoardings/presentation/manager/models/onbarding_data_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  OnboardingViewState createState() => OnboardingViewState();
}

class OnboardingViewState extends State<OnboardingView> {
  final PageController _pageController = PageController();
  int currentIndex = 0;
  Timer? timer;

  final List<OnboardingPageData> onboardingPages = [
    OnboardingPageData(
      title: "Flawless Fit with AI",
      description:
          "Smart fashion, smarter fit! Our AI learns your style to give you a personalized, perfect fit every time.",
      image: "assets/images/onBoarding1.png",
    ),
    OnboardingPageData(
      title: "Smart Fashion Chatbot",
      description:
          "Chat with our AI stylist to get outfit ideas, find similar styles, and shop the perfect look instantly!",
      image: "assets/images/onBording2.png",
    ),
    OnboardingPageData(
      title: "See It, Find It",
      description:
          "Don’t know the brand or where to buy it? Simply upload an image, and we’ll do the searching for you.",
      image: "assets/images/onBoardind3.png",
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        currentIndex = _pageController.page?.round() ?? 0;
      });
    });
    _startAutoScroll();
  }

  void _startAutoScroll() {
    timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (currentIndex < onboardingPages.length - 1) {
        _pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      } else {
        timer.cancel();
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const GetStarted()),
        );
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final page = onboardingPages[currentIndex];
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0, right: 16),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginView(
                                  isOnboarding: true,
                                )));
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(color: Color(0xFF92929D), fontSize: 16),
                  ),
                ),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: onboardingPages.length,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  final page = onboardingPages[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            // height: MediaQuery.of(context).size.height * 0.35,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(page.image),
                                fit: BoxFit.cover,
                                alignment: Alignment.topCenter,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        SmoothPageIndicator(
                          controller: _pageController,
                          count: onboardingPages.length,
                          effect: const ExpandingDotsEffect(
                            dotColor: Colors.grey,
                            activeDotColor: Colors.black,
                            dotHeight: 4.0,
                            spacing: 4,
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          page.title,
                          style: const TextStyle(
                            fontSize: 24,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            page.description,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Color(0xFF92929D),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Back button
                  Visibility(
                    visible: currentIndex > 0,
                    child: Container(
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(color: Colors.black, width: 1.5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: IconButton(
                        onPressed: () {
                          if (currentIndex > 0) {
                            _pageController.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          }
                        },
                        icon: const Icon(Icons.arrow_back),
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      if (currentIndex < onboardingPages.length - 1) {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (context) => const GetStarted()),
                        );
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 32),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        currentIndex < onboardingPages.length - 1
                            ? "Next"
                            : "Continue",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
