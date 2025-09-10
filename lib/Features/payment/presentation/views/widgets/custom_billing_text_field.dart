import 'package:flutter/material.dart';
import 'package:store_powered_ai/core/utils/styles.dart';

class CustomBillingTextField extends StatelessWidget {
  const CustomBillingTextField({
    super.key,
    required this.formName,
    required this.onChanged,
    required this.hintText,
  });

  final String formName;
  final Function(String) onChanged;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            formName,
            style: Styles.textStyle16(context).copyWith(
              fontWeight: FontWeight.w400,
              color: Theme.of(context).textTheme.bodyLarge!.color,
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'field is required';
              }
              return null;
            },
            style: Styles.textStyle14(context).copyWith(
              color: isDark ? Colors.white : Colors.black,
            ),
            onChanged: onChanged,
            cursorColor: isDark ? Colors.white : Colors.black,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 8),
              hintText: hintText,
              hintStyle: Styles.textStyle14(context).copyWith(
                color: const Color(0xff92929D),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: const BorderSide(
                  color: Colors.grey,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
