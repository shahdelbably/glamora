import 'package:flutter/material.dart';
import 'package:store_powered_ai/Features/get_started/prersentation/views/widgets/texts.dart';
import 'package:store_powered_ai/Features/home/presentation/views/bottom_nav_view.dart';

class ElvatedButton extends StatelessWidget {
  const ElvatedButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const BottomNavView()));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Texts(
              text: 'Get Started',
              color: Color(0xffFFFFFF),
              fontsize: 20,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
