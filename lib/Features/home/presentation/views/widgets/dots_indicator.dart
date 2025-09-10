import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DotsIndicator extends StatelessWidget {
  const DotsIndicator({
    super.key,
    required this.pageController, required this.count,
  });
  final int count;

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: pageController ,
      count: count,
      axisDirection: Axis.horizontal,
      effect: const SlideEffect(
          spacing: 6.0,
          radius:  25,
          dotWidth:  8.0,
          dotHeight:  8.0,
          dotColor:  Colors.grey,
          activeDotColor: Color(0xff000000)
      ),
    );
  }
}

