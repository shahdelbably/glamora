import 'package:flutter/material.dart';
import 'package:store_powered_ai/Features/filter/presentation/views/widgets/custom_price_filter.dart';

class CustomPriceFilterListView extends StatelessWidget {
  const CustomPriceFilterListView(
      {super.key,
      required this.selectedIndex,
      required this.onPriceTap,
      required this.priceRangeList});
  final int selectedIndex;
  final ValueChanged<int> onPriceTap;
  final List<String> priceRangeList;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(
            bottom: 16,
          ),
          child: GestureDetector(
            onTap: () => onPriceTap(index),
            child: CustomPriceFilter(
                isSelected: selectedIndex == index,
                priceRange: priceRangeList[index]),
          ),
        );
      },
      itemCount: priceRangeList.length,
    );
  }
}
