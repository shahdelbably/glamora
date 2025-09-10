import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_powered_ai/Features/authentication/presentation/manager/auth_cubit.dart';
import 'package:store_powered_ai/Features/profile/presentation/views/widgets/build_label.dart';
import 'package:store_powered_ai/Features/profile/presentation/views/widgets/buildpassfield.dart';
import 'package:store_powered_ai/Features/profile/presentation/views/widgets/custom_appbar.dart';
import 'package:store_powered_ai/Features/profile/presentation/views/widgets/my_orders_confirm_button.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class PasswordManagerView extends StatefulWidget {
  const PasswordManagerView({super.key});

  @override
  State<PasswordManagerView> createState() => _PasswordManagerViewState();
}

class _PasswordManagerViewState extends State<PasswordManagerView> {
  bool _isCurrentPasswordVisible = false;
  bool _isNewPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is ChangePasswordSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              elevation: 0,
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              content: AwesomeSnackbarContent(
                title: 'Success',
                message: 'Password changed successfully',
                contentType: ContentType.success,
              ),
            ),
          );
          Navigator.pop(context);
        } else if (state is ChangePasswordFailure) {
          log("Error تغيييير الباسورد: ${state.error}");

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              elevation: 0,
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              content: AwesomeSnackbarContent(
                title: 'Error',
                message: state.error,
                contentType: ContentType.failure,
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: const ProfileCustomAppBar(title: 'Password Manager'),
          body: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
            child: Column(
              children: [
                Flexible(
                  child: SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildLabel('Current password', FontWeight.w500),
                          buildPasswordField(
                            _isCurrentPasswordVisible,
                            (value) {
                              setState(() {
                                _isCurrentPasswordVisible = value;
                              });
                            },
                            controller: currentPasswordController,
                            showForgot: true,
                            validator: (value) => value!.isEmpty
                                ? 'Enter current password'
                                : null,
                          ),
                          buildLabel('New password', FontWeight.w500),
                          buildPasswordField(
                            _isNewPasswordVisible,
                            (value) {
                              setState(() {
                                _isNewPasswordVisible = value;
                              });
                            },
                            controller: newPasswordController,
                            validator: (value) =>
                                value!.length < 6 ? 'Password too short' : null,
                          ),
                          const SizedBox(height: 16),
                          buildLabel('Confirm password', FontWeight.w500),
                          buildPasswordField(
                            _isConfirmPasswordVisible,
                            (value) {
                              setState(() {
                                _isConfirmPasswordVisible = value;
                              });
                            },
                            controller: confirmPasswordController,
                            validator: (value) =>
                                value != newPasswordController.text
                                    ? 'Passwords don\'t match'
                                    : null,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: MyOrdersConfirmButton(
                      color: Colors.black,
                      text: state is ChangePasswordLoading
                          ? 'Loading...'
                          : 'Change Password',
                      onPressed: state is ChangePasswordLoading
                          ? null
                          : () {
                              if (formKey.currentState!.validate()) {
                                context.read<AuthCubit>().changePassword(
                                    currentPassword:
                                        currentPasswordController.text,
                                    newPassword: newPasswordController.text,
                                    newPasswordConfirm:
                                        confirmPasswordController.text);
                              }
                            },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
