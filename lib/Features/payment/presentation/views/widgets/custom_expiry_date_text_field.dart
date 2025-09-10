import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:store_powered_ai/core/utils/styles.dart';

class CustomExpiryDateTextField extends StatelessWidget {
  const CustomExpiryDateTextField({
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
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(4),
            _ExpiryDateFormatter(),
          ],
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'field is required';
            }
            if (value.length != 5) {
              return 'Invalid expiry date';
            }
            return null;
          },
          onChanged: (value) {
            value.replaceAll('/', '');
            onChanged(value); // تقدر تبعتي cleanValue لو عايزة من غير /
          },
          style: Styles.textStyle14(context).copyWith(
            color: isDark ? Colors.white : Colors.black,
          ),
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

class _ExpiryDateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var digits = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');
    if (digits.length > 4) digits = digits.substring(0, 4);

    var buffer = StringBuffer();
    for (int i = 0; i < digits.length; i++) {
      if (i == 2) buffer.write('/');
      buffer.write(digits[i]);
    }

    final newText = buffer.toString();
    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
