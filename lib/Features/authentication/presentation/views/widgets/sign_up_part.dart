// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_powered_ai/Features/authentication/presentation/manager/auth_cubit.dart';
import 'package:store_powered_ai/Features/authentication/presentation/views/widgets/auth_textform_field.dart';
import 'package:store_powered_ai/Features/authentication/presentation/views/widgets/desc_text.dart';
import 'package:store_powered_ai/Features/authentication/presentation/views/widgets/main_text.dart';
import 'package:store_powered_ai/Features/authentication/presentation/views/widgets/main_button.dart';
import 'package:store_powered_ai/Features/authentication/presentation/views/widgets/question_to_login_or_sign_up.dart';
import 'package:store_powered_ai/Features/get_started/prersentation/views/get_started_view.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class SignUpPart extends StatefulWidget {
  const SignUpPart({super.key, required this.isOnboarding});
  final bool isOnboarding;

  @override
  State<SignUpPart> createState() => _SignUpPartState();
}

class _SignUpPartState extends State<SignUpPart> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            const SizedBox(height: 40),
            const MainText(
              text: 'Signup',
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: const DescText(
                  text: 'Create an account to unlock special offers and more'),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AuthTextFormField(
                    label: 'Enter your First Name',
                    isPassowdField: false,
                    controller: firstNameController,
                    prefixIcon:
                        const Icon(Icons.person, color: Color(0xFF92929D)),
                  ),
                  const SizedBox(height: 12),
                  AuthTextFormField(
                    label: 'Enter your Last Name',
                    isPassowdField: false,
                    controller: lastNameController,
                    prefixIcon:
                        const Icon(Icons.person, color: Color(0xFF92929D)),
                  ),
                  const SizedBox(height: 12),
                  AuthTextFormField(
                    label: 'Enter your email',
                    isPassowdField: false,
                    controller: emailController,
                    prefixIcon:
                        const Icon(Icons.email, color: Color(0xFF92929D)),
                  ),
                  const SizedBox(height: 12),
                  AuthTextFormField(
                    label: 'Enter your Password',
                    isPassowdField: true,
                    controller: passwordController,
                    prefixIcon:
                        const Icon(Icons.lock, color: Color(0xFF92929D)),
                  ),
                  const SizedBox(height: 12),
                  AuthTextFormField(
                    label: 'Confirm Password',
                    isPassowdField: true,
                    controller: confirmPasswordController,
                    prefixIcon:
                        const Icon(Icons.lock, color: Color(0xFF92929D)),
                  ),
                  const SizedBox(height: 32),
                  BlocConsumer<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is AuthSuccess) {
                        if (mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              elevation: 0,
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.transparent,
                              content: AwesomeSnackbarContent(
                                title: 'Success!',
                                message:
                                    'Account created successfully. Welcome!',
                                contentType: ContentType.success,
                              ),
                            ),
                          );
                        }

                        Future.delayed(const Duration(seconds: 2), () {
                          if (mounted) {
                            widget.isOnboarding
                                ? Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const GetStarted()),
                                  )
                                : Navigator.pop(context);
                          }
                        });
                      } else if (state is AuthFailure) {
                        if (mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              elevation: 0,
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.transparent,
                              content: AwesomeSnackbarContent(
                                title: 'Error!',
                                message: state.errorMessage,
                                contentType: ContentType.failure,
                              ),
                            ),
                          );
                        }
                      }
                    },
                    builder: (context, state) {
                      return MainButtonInAuth(
                        text: state is AuthLoading ? 'Signing Up...' : 'Signup',
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          if (formKey.currentState!.validate()) {
                            BlocProvider.of<AuthCubit>(context).register(
                              firstName: firstNameController.text,
                              lastName: lastNameController.text,
                              email: emailController.text,
                              password: passwordController.text,
                              confirmPassword: confirmPasswordController.text,
                            );
                          }
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 40),
                  QuestionToLoginOrSignUp(
                    question: 'You already have an account?',
                    answer: 'Login',
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
