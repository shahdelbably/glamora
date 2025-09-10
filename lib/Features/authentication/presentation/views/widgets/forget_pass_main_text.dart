import 'package:flutter/material.dart';

class ForgetPassMainText extends StatelessWidget {
  const ForgetPassMainText({
    super.key,
    required this.text,
    required this.alignment,
  });

  final String text;
  final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Text(
        text,
        style: TextStyle(
          color: Theme.of(context).textTheme.bodyLarge!.color,
          fontSize: 22,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
