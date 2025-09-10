import 'package:flutter/material.dart';
import 'package:store_powered_ai/core/utils/styles.dart';

class TabsContainer extends StatelessWidget {
  const TabsContainer(
      {super.key, required this.categoryName, required this.isActive});
  final String categoryName;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 28,
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      decoration: BoxDecoration(
          color: isActive ? Colors.black : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: isActive ? Colors.black : const Color(0xffD9D9D9),
          )),
      child: Center(
        child: Text(categoryName,
            style: Styles.textStyle12(context).copyWith(
              color: isActive
                  ? Colors.white
                  : Theme.of(context).textTheme.bodyLarge!.color,
            )),
      ),
    );
  }
}
