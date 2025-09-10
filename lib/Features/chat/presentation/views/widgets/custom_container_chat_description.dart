// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:store_powered_ai/core/utils/styles.dart';

class CustomContainerChatDescription extends StatelessWidget {
  const CustomContainerChatDescription(
      {super.key, required this.text, required this.text2});

  final String text;
  final String text2;

  @override
  Widget build(BuildContext context) {
    // الحصول على الـ brightness (الوضع الليلي أو الفاتح)
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(
        left: 11,
        right: 11,
        top: 11,
        bottom: 11,
      ),
      decoration: BoxDecoration(
        color: const Color(0x7FE9E6EA).withOpacity(0.5),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        children: [
          Text(
            text,
            textAlign: TextAlign.center,
            style: Styles.textStyle14(context).copyWith(
              fontWeight: FontWeight.w500,
              color: isDarkMode
                  ? Colors.white.withOpacity(0.7) // اللون في الوضع الليلي
                  : const Color(0xFF92929D), // اللون في الوضع الفاتح
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            text2,
            textAlign: TextAlign.center,
            maxLines: 3,
            style: Styles.textStyle12(context).copyWith(
              color: isDarkMode
                  ? Colors.white.withOpacity(0.7) // اللون في الوضع الليلي
                  : const Color(0xFF92929D), // اللون في الوضع الفاتح
            ),
          ),
        ],
      ),
    );
  }
}
