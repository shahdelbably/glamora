import 'package:flutter/material.dart';
import 'package:store_powered_ai/Features/filter/presentation/manger/models/color_models.dart';
import 'package:store_powered_ai/Features/filter/presentation/views/widgets/custom_color_tab.dart';

class CustomColorListView extends StatelessWidget {
  const CustomColorListView({
    super.key,
    required this.selectedIndex,
    required this.onColorTap,
    required this.colorList,
    required this.scrollController,
  });
  final ScrollController scrollController;
  final int selectedIndex;
  final ValueChanged<int> onColorTap;
  final List<ColorModels> colorList;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 22,
      ),
      child: SizedBox(
        height: 141,
        child: ListView.builder(
            controller: scrollController,
            itemCount: colorList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: GestureDetector(
                  onTap: () => onColorTap(index),
                  child: CustomColorTab(
                      isSelected: selectedIndex == index,
                      colorModels: colorList[index]),
                ),
              );
            }),
      ),
    );
  }
}
