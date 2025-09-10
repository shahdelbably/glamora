import 'package:flutter/material.dart';
import 'package:store_powered_ai/Features/authentication/presentation/views/widgets/auth_textform_field.dart';
import 'package:store_powered_ai/Features/authentication/presentation/views/widgets/desc_text.dart';
import 'package:store_powered_ai/Features/authentication/presentation/views/widgets/forget_pass_main_text.dart';
import 'package:store_powered_ai/Features/authentication/presentation/views/widgets/main_button.dart';
import 'package:store_powered_ai/Features/authentication/presentation/views/widgets/question_to_login_or_sign_up.dart';
import 'package:store_powered_ai/Features/authentication/presentation/views/widgets/send_code_text_field.dart';

class SendCodeToUserPart extends StatefulWidget {
  const SendCodeToUserPart({super.key});

  @override
  State<SendCodeToUserPart> createState() => _SendCodeToUserPartState();
}

class _SendCodeToUserPartState extends State<SendCodeToUserPart> {
  final List<TextEditingController> _controllers =
      List.generate(6, (_) => TextEditingController());
  final FocusNode focusNode = FocusNode();
  String verificationCode = '';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(height: 40),
            const ForgetPassMainText(
              text: 'Check Your Inbox',
              alignment: Alignment.topCenter,
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: const DescText(
                text:
                    'A 6-digit confirmation code has been sent to your email.',
              ),
            ),
            const SizedBox(height: 24),
            sendCodeVerificationTextField(controllers: _controllers),
            const SizedBox(height: 50),
            const ForgetPassMainText(
              text: 'Create new password',
              alignment: Alignment.topLeft,
            ),
            const SizedBox(height: 16),
            AuthTextFormField(
              label: 'Enter your Password',
              isPassowdField: true,
              prefixIcon: const Icon(
                Icons.lock,
                color: Color(0xFF92929D),
              ),
              controller: TextEditingController(),
            ),
            const SizedBox(height: 24),
            AuthTextFormField(
              label: 'Confirm Password',
              isPassowdField: true,
              prefixIcon: const Icon(
                Icons.lock,
                color: Color(0xFF92929D),
              ),
              controller: TextEditingController(),
            ),
            const SizedBox(height: 32),
            MainButtonInAuth(
              text: 'Change your password',
              onTap: () {},
            ),
            const SizedBox(height: 24),
            QuestionToLoginOrSignUp(
              question: 'No code?',
              answer: 'Get another one',
              onTap: () {},
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
