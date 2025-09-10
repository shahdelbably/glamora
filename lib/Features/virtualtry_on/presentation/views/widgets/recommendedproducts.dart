

  import 'package:flutter/material.dart';

class BuildItemThumbleNail extends StatelessWidget {
  const BuildItemThumbleNail({super.key, required this.imagePath});

final String imagePath ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          imagePath,
          width: 120,
          height: 120,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
