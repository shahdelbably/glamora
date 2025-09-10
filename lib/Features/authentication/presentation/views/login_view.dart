import 'package:flutter/material.dart';
import 'package:store_powered_ai/Features/authentication/presentation/views/widgets/auth_body.dart';
import 'package:store_powered_ai/Features/authentication/presentation/views/widgets/login_part.dart';

class LoginView extends StatelessWidget {
  const LoginView( {super.key, required this.isOnboarding, this.returnScreen});

 final bool isOnboarding;
 final Widget? returnScreen;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBody(sectionName: LoginPart(isOnboarding: isOnboarding,),),
    );
  }
}

