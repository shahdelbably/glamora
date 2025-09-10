import 'package:flutter/material.dart';
import 'package:store_powered_ai/core/utils/styles.dart';

class CustomButtonFilter extends StatelessWidget {
  const CustomButtonFilter(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.colorButton,
      required this.colorText,
      required this.shadowColorButton});
  final String text;
  final void Function() onPressed;
  final Color colorButton;
  final Color shadowColorButton;
  final Color colorText;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: colorButton,
        shadowColor: shadowColorButton,
        padding: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        side: const BorderSide(
          color: Colors.black,
        ),
      ),
      child: Text(
        text,
        style: Styles.textStyle14(context).copyWith(
          fontWeight: FontWeight.w500,
          color: colorText,
        ),
      ),
    );
  }
}
