import 'package:flutter/material.dart';
import 'package:store_powered_ai/Features/profile/presentation/views/widgets/profile_content.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/profileBackground.jpg'),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.only(top: 160),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(50), topRight: Radius.circular(50)),
          color: Theme.of(context).brightness == Brightness.dark
              ? Theme.of(context).colorScheme.surface
              : Colors.white,
        ),
        child: const Profilecontent(),
      ),
    );
  }
}
