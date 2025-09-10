import 'package:flutter/material.dart';

class MyOrdersConfirmButton extends StatelessWidget {
  const MyOrdersConfirmButton({
    super.key, required this.color, required this.text,required this.onPressed
  });

  final Color color;
  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
           shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8), 
          ),
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
        child: Text(
          text,
          style: const TextStyle(color: Color(0xffffffff),fontSize: 16),
        ),
      ),
    );
  }
}

