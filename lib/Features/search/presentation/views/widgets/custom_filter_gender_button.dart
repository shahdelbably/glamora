import 'package:flutter/material.dart';
import 'package:store_powered_ai/core/utils/styles.dart';

class CustomFilterGenderButton extends StatelessWidget {
  const CustomFilterGenderButton(
      {super.key,
      required this.isSelected,
      required this.text,
      required this.onPressed});
  final bool isSelected;
  final String text;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? Colors.black : Colors.transparent,
          shadowColor: isSelected ? Colors.black : Colors.transparent,
          padding: const EdgeInsets.symmetric(vertical: 10),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
              side: BorderSide(
                color: isSelected ? Colors.black : const Color(0xff92929D),
                width: 1.2,
              )),
        ),
        child: Text(
          text,
          style: Styles.textStyle14(context).copyWith(
              color: isSelected
                  ? Colors.white
                  : Theme.of(context).textTheme.bodyLarge!.color),
        ),
      ),
    );
  }
}
