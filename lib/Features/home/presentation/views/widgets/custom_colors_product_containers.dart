import 'package:flutter/material.dart';

class CustomColorsProductContainers extends StatelessWidget {
  const CustomColorsProductContainers(
      {super.key, required this.color, required this.isSelected});
  final Color color;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 22,
      height: 22,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isSelected ? color : Colors.transparent,
        ),
      ),
      child: Center(
        child: CircleAvatar(
          radius: 7,
          backgroundColor: color,
        ),
      ),
    );
  }
}
