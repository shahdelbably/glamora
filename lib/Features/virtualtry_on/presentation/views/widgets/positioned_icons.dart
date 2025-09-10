// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class PositionedaddIconForRecommendation extends StatefulWidget {
  PositionedaddIconForRecommendation({
    super.key,
    required this.leftVal,
    required this.topVal,
    required this.onIconTap,
  });

  final double leftVal;
  final double topVal;
  final Function(bool) onIconTap;
  bool istapped = false;

  @override
  State<PositionedaddIconForRecommendation> createState() =>
      _PositionedaddIconForRecommendationState();
}

class _PositionedaddIconForRecommendationState
    extends State<PositionedaddIconForRecommendation> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: widget.leftVal,
      top: widget.topVal,
      child: GestureDetector(
        onTap: () {
          setState(() {
            widget.istapped = true;
          });
          widget.onIconTap(true);
        },
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black,
          ),
          child: const Icon(
            Icons.add,
            size: 40,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
