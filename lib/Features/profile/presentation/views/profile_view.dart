import 'package:flutter/material.dart';
import 'package:store_powered_ai/Features/home/presentation/views/bottom_nav_view.dart';
import 'package:store_powered_ai/Features/profile/presentation/views/widgets/custom_appbar.dart';
import 'package:store_powered_ai/Features/profile/presentation/views/widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: ProfileCustomAppBar(
        color: Colors.white,
        title: 'Profile',
        titleColor: Colors.white,
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    const BottomNavView()), // يرجّع للـ HomeView
          );
        },
      ),
      body: const ProfileViewBody(),
    );
  }
}
