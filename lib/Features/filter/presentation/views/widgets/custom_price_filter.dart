import 'package:flutter/material.dart';
import 'package:store_powered_ai/core/utils/styles.dart';

class CustomPriceFilter extends StatelessWidget {
  const CustomPriceFilter(
      {super.key, required this.isSelected, required this.priceRange});
  final bool isSelected;
  final String priceRange;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 15,
          height: 15,
          decoration: BoxDecoration(
            border: Border.all(
              color: isSelected
                  ? Theme.of(context).textTheme.bodyLarge!.color!
                  : const Color(0xff6E685F),
            ),
            color: isSelected
                ? Theme.of(context).textTheme.bodyLarge!.color!
                : Colors.transparent,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(priceRange,
            style: Styles.textStyle14(context).copyWith(
              fontWeight: FontWeight.w500,
              color: isSelected
                  ? Theme.of(context).textTheme.bodyLarge!.color
                  : const Color(0xff6E685F),
            ))
      ],
    );
  }
}
