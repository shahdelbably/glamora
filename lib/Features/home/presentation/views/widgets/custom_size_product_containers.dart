import 'package:flutter/material.dart';
import 'package:store_powered_ai/core/utils/styles.dart';

class CustomSizeProductContainers extends StatelessWidget {
  const CustomSizeProductContainers(
      {super.key, required this.isSelected, required this.size});
  final bool isSelected;
  final String size;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 26,
      height: 26,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: isSelected ? Colors.black : Colors.transparent,
        border: Border.all(
          color: isSelected ? Colors.black : const Color(0xff92929D),
        ),
      ),
      child: Center(
        child: Text(
          size,
          style: Styles.textStyle12(context).copyWith(
            color: isSelected ? Colors.white : const Color(0xff7B7B7B),
          ),
        ),
      ),
    );
  }
}
