import 'package:flutter/material.dart';

class MainButtonInAuth extends StatelessWidget {
  const MainButtonInAuth({
    super.key, required this.text,
   required this.onTap
  });

  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
     onTap:onTap,
      child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 13),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
       color: Colors.black,
       shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(10),
       ),
                ),
                child: Text(
       text,
       textAlign: TextAlign.center,
       style:const TextStyle(
         color: Colors.white,
         fontSize: 20,
         fontFamily: 'Poppins',
         fontWeight: FontWeight.w500,
       ),
                ),
              ),
    );
  }
}

