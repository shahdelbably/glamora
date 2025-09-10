import 'package:flutter/material.dart';

class CustomChoiceMethod extends StatelessWidget {
  const CustomChoiceMethod({
    super.key,
    required this.onTap,
    required this.isSelected,
  });

  final Function() onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 22,
        height: 22,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected
                ? Theme.of(context).textTheme.bodyLarge!.color!
                : const Color(0xff92929D),
          ),
        ),
        child: Center(
          child: CircleAvatar(
            radius: 6,
            backgroundColor: isSelected
                ? Theme.of(context).textTheme.bodyLarge!.color!
                : Colors.transparent,
          ),
        ),
      ),
    );
  }
}
