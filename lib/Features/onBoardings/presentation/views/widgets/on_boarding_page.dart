// import 'package:flutter/material.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// import 'package:store_powered_ai/Features/authentication/presentation/views/login_view.dart';
// import 'package:store_powered_ai/Features/get_started/prersentation/views/get_started_view.dart';
// import 'package:store_powered_ai/Features/onBoardings/presentation/manager/models/onbarding_data_model.dart';

// class OnboardingPage extends StatelessWidget {
//   final OnboardingPageData page;
//   final int currentIndex;
//   final PageController pageController;
//   final List<OnboardingPageData> onboardingPages;

//   const OnboardingPage({
//     super.key,
//     required this.page,
//     required this.pageController,
//     required this.currentIndex,
//     required this.onboardingPages,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(right: 8.0, left: 8.0, top: 32.0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Align(
//             alignment: Alignment.topRight,
//             child: TextButton(
//               onPressed: () {
//                 Navigator.of(context).pushReplacement(
//                   MaterialPageRoute(builder: (context) => const LoginView()),
//                 );
//               },
//               child: const Text(
//                 "Login",
//                 style: TextStyle(color: Color(0xFF92929D), fontSize: 16),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(right: 16.0, left: 16.0),
//             child: Container(
//               height: MediaQuery.of(context).size.height * 0.5,
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage(page.image),
//                   fit: BoxFit.cover,
//                   alignment: Alignment.topCenter,
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             child: Container(
//               padding: const EdgeInsets.only(
//                 top: 32,
//                 left: 16,
//                 right: 15,
//                 bottom: 24,
//               ),
//               clipBehavior: Clip.antiAlias,
//               decoration: const BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(40),
//                   topRight: Radius.circular(40),
//                 ),
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Column(
//                     children: [
//                       SmoothPageIndicator(
//                         controller: pageController,
//                         count: onboardingPages.length,
//                         effect: const ExpandingDotsEffect(
//                           dotColor: Colors.grey,
//                           activeDotColor: Colors.black,
//                           dotHeight: 4.0,
//                           spacing: 4,
//                         ),
//                       ),
//                       const SizedBox(height: 15),
//                       Text(
//                         page.title,
//                         style: const TextStyle(
//                           fontSize: 24,
//                           color: Colors.black,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                         child: Text(
//                           page.description,
//                           style: const TextStyle(
//                             fontSize: 18,
//                             color: Color(0xFF92929D),
//                           ),
//                           textAlign: TextAlign.center,
//                         ),
//                       ),
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       SizedBox(
//                         width: 60,
//                         child: Visibility(
//                           visible: currentIndex > 0,
//                           child: Container(
//                             decoration: BoxDecoration(
//                               color: Colors.transparent,
//                               border: Border.all(
//                                 color: Colors.black,
//                                 width: 1.5,
//                               ),
//                               borderRadius: BorderRadius.circular(10.0),
//                             ),
//                             child: IconButton(
//                               onPressed: () {
//                                 if (currentIndex > 0) {
//                                   pageController.previousPage(
//                                     duration:
//                                         const Duration(milliseconds: 300),
//                                     curve: Curves.easeInOut,
//                                   );
//                                 }
//                               },
//                               icon: const Icon(Icons.arrow_back),
//                             ),
//                           ),
//                         ),
//                       ),
//                       GestureDetector(
//                         onTap: () {
//                           if (currentIndex < onboardingPages.length - 1) {
//                             pageController.nextPage(
//                               duration: const Duration(milliseconds: 300),
//                               curve: Curves.easeInOut,
//                             );
//                           } else {
//                             Navigator.of(context).pushReplacement(
//                               MaterialPageRoute(
//                                   builder: (context) => const GetStarted()),
//                             );
//                           }
//                         },
//                         child: Container(
//                           padding: const EdgeInsets.all(16),
//                           decoration: BoxDecoration(
//                             color: Colors.black,
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           child: Padding(
//                             padding:
//                                 const EdgeInsets.symmetric(horizontal: 16.0),
//                             child: Text(
//                               currentIndex < onboardingPages.length - 1
//                                   ? "Next"
//                                   : "Continue",
//                               style: const TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:store_powered_ai/Features/authentication/presentation/views/login_view.dart';
import 'package:store_powered_ai/Features/get_started/prersentation/views/get_started_view.dart';
import 'package:store_powered_ai/Features/onBoardings/presentation/manager/models/onbarding_data_model.dart';

class OnboardingPage extends StatelessWidget {
  final OnboardingPageData page;
  final int currentIndex;
  final PageController pageController;
  final List<OnboardingPageData> onboardingPages;

  const OnboardingPage({
    super.key,
    required this.page,
    required this.pageController,
    required this.currentIndex,
    required this.onboardingPages,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 32.0, right: 16),
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                          builder: (context) => const LoginView(
                                isOnboarding: true,
                              )),
                    );
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(color: Color(0xFF92929D), fontSize: 16),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: constraints.maxHeight * 0.45,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(page.image),
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        SmoothPageIndicator(
                          controller: pageController,
                          count: onboardingPages.length,
                          effect: const ExpandingDotsEffect(
                            dotColor: Colors.grey,
                            activeDotColor: Colors.black,
                            dotHeight: 4.0,
                            spacing: 4,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          page.title,
                          style: const TextStyle(
                            fontSize: 24,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          page.description,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Color(0xFF92929D),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 60,
                          child: Visibility(
                            visible: currentIndex > 0,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1.5,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: IconButton(
                                onPressed: () {
                                  if (currentIndex > 0) {
                                    pageController.previousPage(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.easeInOut,
                                    );
                                  }
                                },
                                icon: const Icon(Icons.arrow_back),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (currentIndex < onboardingPages.length - 1) {
                              pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            } else {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => const GetStarted(),
                                ),
                              );
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 16,
                              horizontal: 32,
                            ),
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
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
