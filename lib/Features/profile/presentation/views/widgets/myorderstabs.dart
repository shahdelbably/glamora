import 'package:flutter/material.dart';

class MyOrdersTabs extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTabSelected;

  const MyOrdersTabs({
    super.key,
    required this.selectedIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(3, (index) {
        return GestureDetector(
          onTap: () {
            onTabSelected(index);
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 1.5,
                color: selectedIndex == index
                    ? Theme.of(context).textTheme.bodyLarge!.color!
                    : Colors.transparent,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.only(right: 10, left: 10, top: 5, bottom: 5),
              child: Text(
                ['Active', 'Completed', 'Cancelled'][index],
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: selectedIndex == index
                      ? Theme.of(context).textTheme.bodyLarge?.color
                      : Colors.grey,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
