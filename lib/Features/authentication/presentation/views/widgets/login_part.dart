import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_powered_ai/Features/authentication/presentation/manager/auth_cubit.dart';
import 'package:store_powered_ai/Features/authentication/presentation/views/signup_view.dart';
import 'package:store_powered_ai/Features/authentication/presentation/views/widgets/auth_textform_field.dart';
import 'package:store_powered_ai/Features/authentication/presentation/views/widgets/desc_text.dart';
import 'package:store_powered_ai/Features/authentication/presentation/views/widgets/main_text.dart';
import 'package:store_powered_ai/Features/authentication/presentation/views/widgets/main_button.dart';
import 'package:store_powered_ai/Features/authentication/presentation/views/widgets/question_to_login_or_sign_up.dart';
import 'package:store_powered_ai/Features/get_started/prersentation/views/get_started_view.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:store_powered_ai/Features/home/presentation/views/bottom_nav_view.dart';

class LoginPart extends StatelessWidget {
  LoginPart({
    super.key,
    required this.isOnboarding,
    this.returnScreen,
  });

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final bool isOnboarding;
  final Widget? returnScreen;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            const SizedBox(height: 40),
            const MainText(text: 'Login'),
            const SizedBox(height: 15),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: const DescText(
                  text: 'Welcome back! Let’s pick up where you left off'),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AuthTextFormField(
                    controller: emailController,
                    label: 'Enter your email',
                    isPassowdField: false,
                    prefixIcon: const Icon(
                      Icons.email,
                      color: Color(0xFF92929D),
                    ),
                  ),
                  const SizedBox(height: 12),
                  AuthTextFormField(
                    controller: passwordController,
                    label: 'Enter your Password',
                    isPassowdField: true,
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Color(0xFF92929D),
                    ),
                  ),
                  const SizedBox(height: 15),
                  // const SaveInfoAndForgetPassword(),
                  const SizedBox(height: 32),
                  BlocConsumer<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is AuthSuccess) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            elevation: 0,
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.transparent,
                            content: AwesomeSnackbarContent(
                              title: 'Success!',
                              message: 'Logged in successfully. Welcome back!',
                              contentType: ContentType.success,
                            ),
                          ),
                        );
                        if (isOnboarding) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const GetStarted()),
                          );
                        } else if (returnScreen != null) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (_) => returnScreen!),
                          );
                        } else {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const BottomNavView()),
                          );
                        }
                      } else if (state is AuthFailure) {
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
                    },
                    builder: (context, state) {
                      bool isLoading = state is AuthLoading;
                      return MainButtonInAuth(
                        text: isLoading ? 'Loading...' : 'Login',
                        onTap: isLoading
                            ? null
                            : () {
                                if (formKey.currentState!.validate()) {
                                  FocusScope.of(context).unfocus();
                                  context.read<AuthCubit>().login(
                                        email: emailController.text.trim(),
                                        password:
                                            passwordController.text.trim(),
                                      );
                                }
                              },
                      );
                    },
                  ),
                  const SizedBox(height: 18),
                  // const OrDivider(),
                  // const SizedBox(height: 18),
                  // const SocialLogin(),
                  // const SizedBox(height: 32),
                  QuestionToLoginOrSignUp(
                    question: 'You don’t have an account?',
                    answer: 'Sign Up',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignupView(
                                  isOnboarding: isOnboarding,
                                )),
                      );
                    },
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
