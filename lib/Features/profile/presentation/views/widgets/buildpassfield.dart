import 'package:flutter/material.dart';

Widget buildPasswordField(
  bool isVisible,
  Function(bool) onToggle, {
  bool showForgot = false,
  required TextEditingController controller,
  String? Function(String?)? validator,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Stack(
        alignment: Alignment.centerRight,
        children: [
          TextFormField(
            controller: controller,
            obscureText: !isVisible,
            obscuringCharacter: '*',
            validator: validator,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.transparent,
              hintText: '********',
              hintStyle: const TextStyle(color: Colors.grey),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.black),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
            ),
          ),
          IconButton(
            icon: Icon(isVisible ? Icons.visibility : Icons.visibility_off),
            onPressed: () => onToggle(!isVisible),
          ),
        ],
      ),
      if (showForgot)
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {},
            child: const Text(
              "Forget Password?",
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ),
    ],
  );
}
