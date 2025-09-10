import 'package:flutter/material.dart';
import 'package:store_powered_ai/Features/authentication/presentation/views/forgot_password.dart';

class SaveInfoAndForgetPassword extends StatefulWidget {
  const SaveInfoAndForgetPassword({super.key});

  @override
  SaveInfoAndForgetPasswordState createState() =>
      SaveInfoAndForgetPasswordState();
}

class SaveInfoAndForgetPasswordState extends State<SaveInfoAndForgetPassword> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  isChecked = !isChecked;
                });
              },
              child: Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  color:
                      isChecked ? const Color(0xFF92929D) : Colors.transparent,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: const Color(0xFF92929D),
                    width: 2,
                  ),
                ),
                child: isChecked
                    ? const Center(
                        child: Icon(
                          Icons.check,
                          size: 12,
                          color: Colors.white,
                        ),
                      )
                    : null,
              ),
            ),
            const SizedBox(width: 8),
            const Text(
              'Remember me',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF92929D),
                fontSize: 14,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ForgotPassword()));
          },
          child: Text(
            'Forgot Password',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyLarge!.color,
              fontSize: 12,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
