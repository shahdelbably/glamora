import 'package:flutter/material.dart';
import 'package:store_powered_ai/Features/home/presentation/views/widgets/custom_size_product_containers.dart';
import 'package:store_powered_ai/Features/home/presentation/views/widgets/custom_text_product.dart';

class CustomSizeChoiceProduct extends StatefulWidget {
  const CustomSizeChoiceProduct({
    super.key,
    required this.selectedSize,
    required this.initialSize,
    required this.sizes,
  });

  final ValueNotifier<String> selectedSize;
  final String initialSize;
  final List<String> sizes;
  @override
  State<CustomSizeChoiceProduct> createState() =>
      _CustomSizeChoiceProductState();
}

class _CustomSizeChoiceProductState extends State<CustomSizeChoiceProduct> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    selectedIndex =
        widget.sizes.indexWhere((size) => size == widget.initialSize);
    if (selectedIndex == -1) selectedIndex = 0;
    widget.selectedSize.value = widget.sizes[selectedIndex];
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
            text1: 'Size',
            text2: widget.sizes[selectedIndex],
          ),
          const SizedBox(height: 4),
          SizedBox(
            height: 26,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: widget.sizes.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                        widget.selectedSize.value = widget.sizes[index];
                      });
                    },
                    child: CustomSizeProductContainers(
                      isSelected: index == selectedIndex,
                      size: widget.sizes[index],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
