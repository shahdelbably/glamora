import 'package:flutter/material.dart';
import 'package:store_powered_ai/core/utils/styles.dart';

class CustomNewCardTextField extends StatelessWidget {
  const CustomNewCardTextField({
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          formName,
          style: Styles.textStyle13(context).copyWith(
            fontWeight: FontWeight.w400,
            color: Theme.of(context).textTheme.bodyLarge!.color,
          ),
        ),
        const SizedBox(height: 4),
        TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'field is required';
            }
            return null;
          },
          style: Styles.textStyle13(context).copyWith(
            fontWeight: FontWeight.w400,
            color: isDark ? Colors.white : Colors.black,
          ),
          cursorColor: isDark ? Colors.white : Colors.black,
          onChanged: onChanged,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(left: 9, top: 6, bottom: 6),
            hintText: hintText,
            hintStyle: Styles.textStyle13(context).copyWith(
              color: const Color(0xff92929D),
              fontWeight: FontWeight.w400,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(
                color: isDark ? Colors.grey : Colors.black,
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
        const SizedBox(height: 8),
      ],
    );
  }
}
