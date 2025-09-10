import 'package:flutter/material.dart';
import 'package:store_powered_ai/Features/authentication/presentation/views/widgets/auth_body.dart';
import 'package:store_powered_ai/Features/authentication/presentation/views/widgets/send_code_to_user_part.dart';

class SendCodeToUserView extends StatelessWidget {
  const SendCodeToUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AuthBody(sectionName: SendCodeToUserPart(),),
    );
  }
}