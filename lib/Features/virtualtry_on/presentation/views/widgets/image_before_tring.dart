import 'dart:io';
import 'package:flutter/material.dart';
import 'package:store_powered_ai/Features/virtualtry_on/presentation/views/widgets/positioned_icons.dart';

class ImageBeforeTring extends StatelessWidget {
  const ImageBeforeTring({
    super.key,
    required this.imagePath,
    required this.onIconTap,
  });

  final String imagePath;
  final Function(bool) onIconTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 16.0, bottom: 16.0, right: 20.0, left: 20.0),
      child: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: FileImage(File(imagePath)),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            PositionedaddIconForRecommendation(
              leftVal: 100,
              topVal: 150,
              onIconTap: onIconTap,
            ),
            PositionedaddIconForRecommendation(
              leftVal: 200,
              topVal: 300,
              onIconTap: onIconTap,
            ),
          ],
        ),
      ),
    );
  }
}
