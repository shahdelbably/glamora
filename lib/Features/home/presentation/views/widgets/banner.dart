import 'package:flutter/material.dart';

class BannerItems extends StatelessWidget {
   BannerItems({
    super.key,
    required this.pageController,
  });

  final PageController pageController;
  final List<String> bannerImages=[
  'assets/images/banners2.jpg',
  'assets/images/banner1.jpg',
  'assets/images/banners3.jpg',
  'assets/images/banner4.jpg',
  'assets/images/banner5.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: double.infinity,
      child: PageView.builder(
        controller: pageController,
        physics: const BouncingScrollPhysics(),
        itemCount: bannerImages.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Image.asset(
              bannerImages[index],
              fit: BoxFit.fill,
            ),
          );
        },
  ),
);
}
}