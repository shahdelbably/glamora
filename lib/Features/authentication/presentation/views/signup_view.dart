import 'package:flutter/material.dart';
import 'package:store_powered_ai/Features/authentication/presentation/views/widgets/auth_body.dart';
import 'package:store_powered_ai/Features/authentication/presentation/views/widgets/sign_up_part.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key, required this.isOnboarding});
  final bool isOnboarding;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AuthBody(
      sectionName: SignUpPart(
        isOnboarding: isOnboarding,
      ),
    ));
  }
}
