import 'package:flutter/material.dart';
import 'package:store_powered_ai/core/widgets/tabs_container.dart';

class CategoryContainerListView extends StatefulWidget {
  const CategoryContainerListView({super.key});

  @override
  State<CategoryContainerListView> createState() =>
      _CategoryContainerListViewState();
}

class _CategoryContainerListViewState extends State<CategoryContainerListView> {
  List<String> category = const [
    'All',
    'Popular',
    'Newest',
    'Trendy',
    'Men',
    'Women'
  ];
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 26,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: category.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(
              right: 8,
            ),
            child: GestureDetector(
              onTap: () {
                activeIndex = index;
                setState(() {});
              },
              child: TabsContainer(
                  categoryName: category[index],
                  isActive: activeIndex == index),
            ),
          );
        },
      ),
    );
  }
}
