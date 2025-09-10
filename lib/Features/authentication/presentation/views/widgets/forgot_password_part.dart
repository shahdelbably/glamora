import 'package:flutter/material.dart';
import 'package:store_powered_ai/Features/authentication/presentation/views/send_code_to_user_view.dart';
import 'package:store_powered_ai/Features/authentication/presentation/views/widgets/auth_textform_field.dart';
import 'package:store_powered_ai/Features/authentication/presentation/views/widgets/desc_text.dart';
import 'package:store_powered_ai/Features/authentication/presentation/views/widgets/forget_pass_main_text.dart';
import 'package:store_powered_ai/Features/authentication/presentation/views/widgets/main_button.dart';

class ForgotPasswordPart extends StatelessWidget {
  ForgotPasswordPart({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              const ForgetPassMainText(
                text: 'Forgot Password',
                alignment: Alignment.topCenter,
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: const DescText(
                      text:
                          'Enter Your Email address to receive verification code.')),
              const SizedBox(
                height: 24,
              ),
              AuthTextFormField(
                  label: 'Enter your email',
                  isPassowdField: false,
                  controller: TextEditingController(),
                  prefixIcon: const Icon(
                    Icons.email,
                    color: Color(0xFF92929D),
                  )),
              const SizedBox(
                height: 32,
              ),
              MainButtonInAuth(
                  text: 'Send',
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const SendCodeToUserView()));
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
