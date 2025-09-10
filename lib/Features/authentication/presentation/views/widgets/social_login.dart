import 'package:flutter/material.dart';

class SocialLogin extends StatelessWidget {
  const SocialLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
     mainAxisAlignment: MainAxisAlignment.center,
      children: [
       Image.asset('assets/images/facebook.png'),
      const SizedBox(width: 18,),
      Image.asset('assets/images/google.png'),
      const SizedBox(width: 18,),            
       Image.asset('assets/images/apple.png'),
      ],
    );
  }
}

