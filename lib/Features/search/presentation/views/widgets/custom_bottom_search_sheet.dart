// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:store_powered_ai/Features/home/data/models/product_models.dart';
import 'package:store_powered_ai/Features/home/presentation/views/widgets/product_card_grid_view.dart';
import 'package:store_powered_ai/core/utils/styles.dart';

class CustomBottomSearchSheet extends StatelessWidget {
  CustomBottomSearchSheet(
      {super.key, required this.productModel, required this.issearchWithImage});
  final List<ProductModel> productModel;
  bool issearchWithImage;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 16,
        right: 15,
        top: 24,
      ),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.75,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Image Search',
                    style: Styles.textStyle24(context).copyWith(
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Inter',
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.close,
                      size: 27,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              ProductCardGridView(
                  products: productModel, isSearchWithImage: issearchWithImage),
            ],
          ),
        ),
      ),
    );
  }
}
