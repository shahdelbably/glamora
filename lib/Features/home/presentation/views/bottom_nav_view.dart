// import 'package:flutter/material.dart';
// import 'package:ming_cute_icons/ming_cute_icons.dart';
// import 'package:store_powered_ai/Features/cart/presentation/views/cart_view.dart';
// import 'package:store_powered_ai/Features/chat/presentation/views/start_chat_view.dart';
// import 'package:store_powered_ai/Features/home/presentation/views/home_view.dart';
// import 'package:store_powered_ai/Features/profile/presentation/views/profile_view.dart';
// import 'package:store_powered_ai/Features/search/presentation/views/search_nav_bar_view.dart';

// class BottomNavView extends StatefulWidget {
//   const BottomNavView({super.key});

//   @override
//   State<BottomNavView> createState() => _BottomNavViewState();
// }

// class _BottomNavViewState extends State<BottomNavView> {
//   int selectedIndex = 0;

//   final List<Widget> screenOptions = const [
//     HomeView(),
//     CartView(),
//     SearchNavBarView(),
//     StartChatView(),
//     ProfileView()
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         if (selectedIndex != 0) {
//           setState(() {
//             selectedIndex = 0;
//           });
//           return false;
//         }
//         return true;
//       },
//       child: Scaffold(
//         body: Stack(
//           clipBehavior: Clip.none,
//           children: [
//             Positioned.fill(child: screenOptions[selectedIndex]),

//             // Positioned(
//             //   bottom: 0,
//             //   left: 0,
//             //   right: 0,
//             //   child: Container(
//             //     height: 50,
//             //     color: Colors.transparent,
//             //   ),
//             // ),

//             Positioned(
//               bottom: 16,
//               left: 16,
//               right: 16,
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(40),
//                 child: Container(
//                   height: 65,
//                   color: Colors.black,
//                   padding: const EdgeInsets.symmetric(horizontal: 8),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: List.generate(5, (index) {
//                       bool isSelected = selectedIndex == index;
//                       return Expanded(
//                         child: GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               selectedIndex = index;
//                             });
//                           },
//                           child: Stack(
//                             alignment: Alignment.center,
//                             clipBehavior: Clip.none,
//                             children: [
//                               if (isSelected)
//                                 Positioned(
//                                   top: -35,
//                                   child: Material(
//                                     color: Colors.transparent,
//                                     child: Container(
//                                       width: 50,
//                                       height: 50,
//                                       decoration: const BoxDecoration(
//                                         color: Colors.white,
//                                         shape: BoxShape.circle,
//                                       ),
//                                       child: Center(
//                                         child: Icon(
//                                           _getIconForIndex(index),
//                                           color: Colors.black,
//                                           size: 24,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               Column(
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: [
//                                   Icon(
//                                     _getIconForIndex(index),
//                                     color: isSelected ? Colors.transparent : const Color(0xffA3A3A3),
//                                     size: 20,
//                                   ),
//                                   if (!isSelected) const SizedBox(height: 2),
//                                   if (!isSelected)
//                                     Text(
//                                       _getLabelForIndex(index),
//                                       style: const TextStyle(
//                                         color: Color(0xffA3A3A3),
//                                         fontSize: 11,
//                                         fontWeight: FontWeight.w600,
//                                       ),
//                                     ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     }),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   IconData _getIconForIndex(int index) {
//     switch (index) {
//       case 0:
//         return Icons.home;
//       case 1:
//         return Icons.shopping_cart;
//       case 2:
//         return MingCuteIcons.mgc_search_3_fill;
//       case 3:
//         return Icons.chat;
//       case 4:
//         return Icons.person;
//       default:
//         return Icons.home;
//     }
//   }

//   String _getLabelForIndex(int index) {
//     switch (index) {
//       case 0:
//         return "Home";
//       case 1:
//         return "Cart";
//       case 2:
//         return "Search";
//       case 3:
//         return "Chat";
//       case 4:
//         return "Profile";
//       default:
//         return "";
//     }
//   }
// }

// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:ming_cute_icons/ming_cute_icons.dart';
import 'package:store_powered_ai/Features/cart/presentation/views/cart_view.dart';
import 'package:store_powered_ai/Features/chat/presentation/views/start_chat_view.dart';
import 'package:store_powered_ai/Features/home/presentation/views/home_view.dart';
import 'package:store_powered_ai/Features/profile/presentation/views/profile_view.dart';
import 'package:store_powered_ai/Features/search/presentation/views/search_nav_bar_view.dart';

class BottomNavView extends StatefulWidget {
  const BottomNavView({super.key});

  @override
  State<BottomNavView> createState() => _BottomNavViewState();
}

class _BottomNavViewState extends State<BottomNavView> {
  int selectedIndex = 0;

  final List<Widget> screenOptions = const [
    HomeView(),
    CartView(),
    SearchNavBarView(),
    StartChatView(),
    ProfileView()
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (selectedIndex != 0) {
          setState(() {
            selectedIndex = 0;
          });
          return false;
        }
        return true;
      },
      child: Scaffold(
        body: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned.fill(child: screenOptions[selectedIndex]),

            // الخلفية البيضاء تحت البوتوم بار
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 100, // ارتفاع يغطي المنطقة تحت البوتوم بار
                color: Theme.of(context).brightness == Brightness.dark
                    ? Theme.of(context).colorScheme.background
                    : Colors.white,
              ),
            ),

            Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Container(
                  height: 65,
                  color: Colors.black,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(5, (index) {
                      bool isSelected = selectedIndex == index;
                      return Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            clipBehavior: Clip.none,
                            children: [
                              if (isSelected)
                                Positioned(
                                  top: -35,
                                  child: Material(
                                    color: Colors.transparent,
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                        child: Icon(
                                          _getIconForIndex(index),
                                          color: Colors.black,
                                          size: 24,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    _getIconForIndex(index),
                                    color: isSelected
                                        ? Colors.transparent
                                        : const Color(0xffA3A3A3),
                                    size: 20,
                                  ),
                                  if (!isSelected) const SizedBox(height: 2),
                                  if (!isSelected)
                                    Text(
                                      _getLabelForIndex(index),
                                      style: const TextStyle(
                                        color: Color(0xffA3A3A3),
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getIconForIndex(int index) {
    switch (index) {
      case 0:
        return Icons.home;
      case 1:
        return Icons.shopping_cart;
      case 2:
        return MingCuteIcons.mgc_search_3_fill;
      case 3:
        return Icons.chat;
      case 4:
        return Icons.person;
      default:
        return Icons.home;
    }
  }

  String _getLabelForIndex(int index) {
    switch (index) {
      case 0:
        return "Home";
      case 1:
        return "Cart";
      case 2:
        return "Search";
      case 3:
        return "Chat";
      case 4:
        return "Profile";
      default:
        return "";
    }
  }
}
