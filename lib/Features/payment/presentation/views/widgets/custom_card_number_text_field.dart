import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:store_powered_ai/core/utils/styles.dart';

class CustomCardNumberTextField extends StatelessWidget {
  const CustomCardNumberTextField({
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
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(19),
            CreditCardNumberInputFormatter(),
          ],
          validator: (value) {
            final pureValue = value!.replaceAll(' ', '');
            if (pureValue.isEmpty) {
              return 'field is required';
            }
            if (pureValue.length != 16) {
              return 'card number must be 16 digits';
            }
            return null;
          },
          style: Styles.textStyle13(context).copyWith(
            fontWeight: FontWeight.w400,
            color: isDark ? Colors.white : Colors.black,
          ),
          cursorColor: isDark ? Colors.white : Colors.black,
          onChanged: (value) {
            final pureNumber = value.replaceAll(' ', '');
            onChanged(pureNumber);
          },
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(
              left: 9,
              top: 6,
              bottom: 6,
            ),
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

class CreditCardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String digits = newValue.text.replaceAll(RegExp(r'\D'), '');
    if (digits.length > 16) digits = digits.substring(0, 16);

    String newString = '';
    for (int i = 0; i < digits.length; i++) {
      if (i % 4 == 0 && i != 0) newString += ' ';
      newString += digits[i];
    }

    return TextEditingValue(
      text: newString,
      selection: TextSelection.collapsed(offset: newString.length),
    );
  }
}
