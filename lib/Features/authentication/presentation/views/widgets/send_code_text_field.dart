import 'package:flutter/material.dart';

// ignore: camel_case_types
class sendCodeVerificationTextField extends StatelessWidget {
  const sendCodeVerificationTextField({
    super.key,
    required List<TextEditingController> controllers,
  }) : _controllers = controllers;

  final List<TextEditingController> _controllers;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List<Widget>.generate(6, (index) {
          return Container(
            width: 40,
            margin: const EdgeInsets.symmetric(horizontal: 5),
            child: TextField(
              controller: _controllers[index],
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              maxLength: 1,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 30,
              ),
              decoration: const InputDecoration(
                hintText: '•',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 40,
                ),
                counterText: '',
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2),
                ),
              ),
              onChanged: (value) {
                if (value.length == 1 && index < 5) {
                  FocusScope.of(context).nextFocus();
                } else if (value.isEmpty && index > 0) {
                  FocusScope.of(context).previousFocus();
                }
              },
            ),
          );
        }),
      ),
    );
  }
}
