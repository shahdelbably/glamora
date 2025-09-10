import 'package:flutter/material.dart';
import 'package:store_powered_ai/Features/home/data/models/colors_product_model.dart';
import 'package:store_powered_ai/Features/home/presentation/views/widgets/custom_colors_product_containers.dart';
import 'package:store_powered_ai/Features/home/presentation/views/widgets/custom_text_product.dart';

class CustomColorChoiceProduct extends StatefulWidget {
  const CustomColorChoiceProduct(
      {super.key, required this.colorsProductModel, this.onColorSelected});
  final ColorsProductModel colorsProductModel;
  final Function(ColorsProductModel)? onColorSelected;

  @override
  State<CustomColorChoiceProduct> createState() =>
      _CustomColorChoiceProductState();
}

class _CustomColorChoiceProductState extends State<CustomColorChoiceProduct> {
  List<ColorsProductModel> choiceColor = [
    ColorsProductModel(colorName: 'Red', color: Colors.red),
    ColorsProductModel(colorName: 'Blue', color: Colors.blue),
    ColorsProductModel(colorName: 'Yellow', color: Colors.yellow),
    ColorsProductModel(colorName: 'Black', color: Colors.black),
    ColorsProductModel(colorName: 'Grey', color: Colors.grey),
  ];
  int selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    selectedIndex = choiceColor.indexWhere(
        (color) => color.colorName == widget.colorsProductModel.colorName);
    if (selectedIndex == -1) {
      selectedIndex = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextProduct(
              text1: 'Color', text2: choiceColor[selectedIndex].colorName),
          const SizedBox(
            height: 4,
          ),
          SizedBox(
            height: 22,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: choiceColor.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      right: 4,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                        if (widget.onColorSelected != null) {
                          widget.onColorSelected!(choiceColor[selectedIndex]);
                        }
                      },
                      child: CustomColorsProductContainers(
                          color: choiceColor[index].color,
                          isSelected: index == selectedIndex),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
