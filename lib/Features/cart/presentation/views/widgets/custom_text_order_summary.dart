import 'package:flutter/material.dart';
import 'package:store_powered_ai/core/utils/styles.dart';

class CustomTextOrderSummary extends StatelessWidget {
  const CustomTextOrderSummary(
      {super.key, required this.text, required this.text2});
  final String text;
  final String text2;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: Styles.textStyle14(context).copyWith(
              fontWeight: FontWeight.w500,
              color: const Color(0xff92929D),
            ),
          ),
          Text(
            text2,
            style: Styles.textStyle14(context).copyWith(
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
