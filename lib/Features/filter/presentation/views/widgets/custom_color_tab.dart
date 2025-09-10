import 'package:flutter/material.dart';
import 'package:store_powered_ai/Features/filter/presentation/manger/models/color_models.dart';
import 'package:store_powered_ai/core/utils/styles.dart';

class CustomColorTab extends StatelessWidget {
  const CustomColorTab(
      {super.key, required this.isSelected, required this.colorModels});
  final ColorModels colorModels;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
              border: Border.all(
                color: isSelected ? colorModels.color : const Color(0xff6E685F),
              ),
              color: isSelected ? colorModels.color : Colors.transparent,
              shape: BoxShape.circle),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(colorModels.colorName,
            style: Styles.textStyle14(context).copyWith(
              fontWeight: FontWeight.w500,
            )),
      ],
    );
  }
}
