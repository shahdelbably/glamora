import 'package:flutter/material.dart';
import 'package:store_powered_ai/core/utils/asset_data.dart';
import 'package:store_powered_ai/core/utils/styles.dart';
import 'package:store_powered_ai/core/widgets/custom_button.dart';

class EmptyProduct extends StatelessWidget {
  const EmptyProduct({super.key, required this.text, required this.onPressed});
  final String text;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(AssetsData.emptyBox),
        const SizedBox(
          height: 12,
        ),
        Text(
          'No product found!',
          style: Styles.textStyle18(context).copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          text,
          style: Styles.textStyle13(context).copyWith(
            fontWeight: FontWeight.w400,
            color: const Color(0xff92929D),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        CustomButton(
          text: 'Go to Home',
          onPressed: onPressed,
        ),
      ],
    );
  }
}
