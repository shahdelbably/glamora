import 'package:flutter/material.dart';
import 'package:store_powered_ai/Features/authentication/presentation/views/widgets/auth_body.dart';
import 'package:store_powered_ai/Features/authentication/presentation/views/widgets/forgot_password_part.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBody(sectionName: ForgotPasswordPart()),
    );
  }
}
