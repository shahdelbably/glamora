import 'package:flutter/material.dart';
import 'package:store_powered_ai/core/utils/styles.dart';

class CustomCoupon extends StatelessWidget {
  const CustomCoupon({
    super.key,
    required this.onPressed,
    required this.onChanged,
  });

  final void Function() onPressed;
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return TextField(
      onChanged: onChanged,
      cursorColor: isDark ? Colors.white : Colors.black,
      style: Styles.textStyle15(context).copyWith(
        fontWeight: FontWeight.w500,
        color: isDark ? Colors.white : Colors.black,
      ),
      decoration: InputDecoration(
        suffixIcon: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: isDark ? Colors.white : Colors.black,
            padding: const EdgeInsets.symmetric(
              horizontal: 23,
              vertical: 10,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            'Apply',
            style: Styles.textStyle15(context).copyWith(
              color: isDark ? Colors.black : Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        hintText: 'Coupon Code',
        hintStyle: Styles.textStyle15(context).copyWith(
          color: const Color(0xff92929D),
          fontWeight: FontWeight.w500,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: isDark ? Colors.grey : const Color(0xffD7D4D8),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: isDark ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
