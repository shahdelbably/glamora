import 'package:flutter/material.dart';
import 'package:store_powered_ai/core/utils/styles.dart';

class CustomTextProduct extends StatelessWidget {
  const CustomTextProduct(
      {super.key, required this.text1, required this.text2});
  final String text1;
  final String text2;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text1,
        style: Styles.textStyle14(context).copyWith(
          fontWeight: FontWeight.w500,
          color: Theme.of(context).textTheme.bodyLarge?.color,
        ),
        children: [
          TextSpan(
            text: ' : ',
            style: Styles.textStyle14(context).copyWith(
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
          TextSpan(
            text: text2,
            style: Styles.textStyle14(context).copyWith(
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}
