import 'package:flutter/material.dart';
import 'package:store_powered_ai/core/widgets/tabs_container.dart';

class FilterTabsListView extends StatelessWidget {
  const FilterTabsListView({
    super.key,
    required this.tabList,
    required this.activeTabsIndex,
    required this.onTabsTap,
  });
  final List<String> tabList;
  final int activeTabsIndex;
  final ValueChanged<int> onTabsTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 26,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: tabList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(
              right: 8,
            ),
            child: GestureDetector(
              onTap: () => onTabsTap(index),
              child: TabsContainer(
                  categoryName: tabList[index],
                  isActive: activeTabsIndex == index),
            ),
          );
        },
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:store_powered_ai/core/widgets/tabs_container.dart';

// class FilterTabsListView extends StatefulWidget {
//   const FilterTabsListView({super.key, required this.tabList});
//   final List<String> tabList;

//   @override
//   State<FilterTabsListView> createState() => _FilterTabsListViewState();
// }

// class _FilterTabsListViewState extends State<FilterTabsListView> {
//   int activeIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 26,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         physics: const BouncingScrollPhysics(),
//         itemCount: widget.tabList.length,
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: const EdgeInsets.only(
//               right: 8,
//             ),
//             child: GestureDetector(
//               onTap: () {
//                 activeIndex = index;
//                 setState(() {});
//               },
//               child: TabsContainer(
//                   categoryName: widget.tabList[index],
//                   isActive: activeIndex == index),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
