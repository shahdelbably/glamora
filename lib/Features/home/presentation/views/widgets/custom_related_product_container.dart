import 'package:flutter/material.dart';
import 'package:store_powered_ai/Features/home/data/models/colors_product_model.dart';
import 'package:store_powered_ai/Features/home/data/models/product_models.dart';
import 'package:store_powered_ai/Features/home/presentation/views/widgets/custom_button_cart_and_try.dart';
import 'package:store_powered_ai/Features/home/presentation/views/widgets/custom_color_choice_product.dart';
import 'package:store_powered_ai/Features/home/presentation/views/widgets/custom_product_details_image.dart';
import 'package:store_powered_ai/Features/home/presentation/views/widgets/custom_size_choice_product.dart';
import 'package:store_powered_ai/Features/home/presentation/views/widgets/custom_tap_bar_product_daetails.dart';
import 'package:store_powered_ai/Features/home/presentation/views/widgets/product_datails_section_one.dart';
import 'package:store_powered_ai/core/utils/styles.dart';

class ProductDetailsBottomSheet extends StatefulWidget {
  const ProductDetailsBottomSheet(
      {super.key, required this.isActive, required this.product});
  final bool isActive;
  final ProductModel product;

  @override
  State<ProductDetailsBottomSheet> createState() =>
      _ProductDetailsBottomSheetState();
}

class _ProductDetailsBottomSheetState extends State<ProductDetailsBottomSheet> {
  ColorsProductModel? selectedColor;
  late final ValueNotifier<String> selectedSize;

  @override
  void initState() {
    super.initState();
    selectedSize = ValueNotifier(widget.product.sizes.first);
    selectedColor =
        ColorsProductModel(colorName: 'Black', color: Colors.black); // default
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(50)),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.94,
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomProductDetailsImage(
                isActive: widget.isActive,
                product: widget.product,
              ),
              const SizedBox(height: 12),
              ProductDatailsSectionOne(
                product: widget.product,
              ),
              const SizedBox(height: 12),
              CustomColorChoiceProduct(
                colorsProductModel:
                    ColorsProductModel(colorName: 'Black', color: Colors.black),
                onColorSelected: (color) {
                  setState(() {
                    selectedColor = color;
                  });
                },
              ),
              const SizedBox(height: 12),
              CustomSizeChoiceProduct(
                sizes: widget.product.sizes,
                selectedSize: selectedSize,
                initialSize: widget.product.sizes.first,
              ),
              const SizedBox(height: 24),
              ValueListenableBuilder<String>(
                valueListenable: selectedSize,
                builder: (context, size, _) {
                  return CustomButtonCartAndTry(
                    product: widget.product,
                    selectedColor: selectedColor?.colorName ?? 'Black',
                    selectedSize: size,
                  );
                },
              ),
              const SizedBox(height: 24),
              CustomTapBarProductDaetails(
                product: widget.product,
              ),
              const SizedBox(height: 24),
              Text(
                'Related Products',
                style: Styles.textStyle12(context),
              ),
              const SizedBox(height: 4),
              Text(
                'Explore Related Products',
                style: Styles.textStyle16(context),
              ),
              const SizedBox(height: 23),
              // CustomRelatedProductListView(
              //   relatedProducts: [product],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
