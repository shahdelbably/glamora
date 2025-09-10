import 'package:flutter/material.dart';

class GroupedImage extends StatelessWidget {
  const GroupedImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
       
           Positioned(
            top: -200,
            right: -98,
            left: -70,
           child: Image.asset('assets/images/Photos group.png'),
    )
         
      ],
    );
  }
}