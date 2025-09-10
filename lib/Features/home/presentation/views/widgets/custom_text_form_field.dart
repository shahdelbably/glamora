import 'package:flutter/material.dart';
import 'package:store_powered_ai/core/utils/styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.formName,
    this.onChanged,
    required this.hintText,
    this.maxLines = 1,
  });
  final String formName;
  final Function(String)? onChanged;
  final String hintText;
  final int maxLines;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          formName,
          style: Styles.textStyle12(context),
        ),
        const SizedBox(
          height: 4,
        ),
        TextFormField(
          validator: (value) {
            if (value!.isEmpty) {
              return 'field is required';
            }
            return null;
          },
          cursorColor: Colors.black,
          maxLines: maxLines,
          style: Styles.textStyle10(context),
          onChanged: onChanged,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(
              left: 12,
              top: 11,
              bottom: 11,
              right: 12,
            ),
            hintText: hintText,
            hintStyle: Styles.textStyle10(context).copyWith(
              color: const Color(0xff92929D),
            ),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(6),
              ),
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(6),
              ),
              borderSide: BorderSide(
                color: Color(0xffD7D4D8),
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(6),
              ),
              borderSide: BorderSide(color: Colors.black),
            ),
          ),
        )
      ],
    );
  }
}
