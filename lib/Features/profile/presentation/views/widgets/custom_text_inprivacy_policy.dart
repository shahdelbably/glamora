import 'package:flutter/material.dart';

class CustomTextinPrivacyPolicy extends StatelessWidget {
  const CustomTextinPrivacyPolicy({
    super.key, required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text,
    style:const TextStyle(fontSize: 14,color: Colors.grey),
    );
  }
}