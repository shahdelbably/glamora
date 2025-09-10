import 'package:flutter/material.dart';

class AuthTextFormField extends StatefulWidget {
  const AuthTextFormField({
    super.key,
    required this.label,
    required this.isPassowdField,
    required this.prefixIcon,
    required this.controller,
  });

  final String label;
  final bool isPassowdField;
  final Widget? prefixIcon;
  final TextEditingController controller;

  @override
  AuthTextFormFieldState createState() => AuthTextFormFieldState();
}

class AuthTextFormFieldState extends State<AuthTextFormField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassowdField;
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return TextFormField(
      controller: widget.controller,
      obscureText: _obscureText,
      style: TextStyle(
        color: isDarkMode
            ? Colors.white
            : Colors.black, // لون النص بناءً على الوضع
      ),
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: TextStyle(
          color: isDarkMode
              ? Colors.white70
              : const Color(0xFF92929D), // لون النص في الـ label
        ),
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.isPassowdField
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey,
                ),
                onPressed: _togglePasswordVisibility,
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: isDarkMode
                ? Colors.white30
                : Colors.grey, // لون الحدود في الوضع الداكن
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: isDarkMode
                ? Colors.white
                : Colors.black, // لون الحدود عند التركيز
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: isDarkMode
                ? Colors.white30
                : const Color(0x6692929D), // لون الحدود عند التمكين
          ),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
    );
  }
}
