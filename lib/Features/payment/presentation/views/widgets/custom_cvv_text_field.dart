import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:store_powered_ai/core/utils/styles.dart';

class CustomCVVTextField extends StatelessWidget {
  const CustomCVVTextField({
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
        const SizedBox(height: 8),
        TextFormField(
          keyboardType: TextInputType.number,
          obscureText: true,
          obscuringCharacter: '*',
          maxLength: 3,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(3),
          ],
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'field is required';
            }
            if (value.length != 3) {
              return 'CVV must be 3 digits';
            }
            return null;
          },
          onChanged: onChanged,
          style: Styles.textStyle14(context).copyWith(
            color: isDark ? Colors.white : Colors.black,
          ),
          cursorColor: isDark ? Colors.white : Colors.black,
          decoration: InputDecoration(
            counterText: '',
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
        const SizedBox(height: 12),
      ],
    );
  }
}
