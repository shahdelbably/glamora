import 'package:flutter/material.dart';
import 'package:store_powered_ai/Features/home/data/models/product_models.dart';
import 'package:store_powered_ai/core/utils/styles.dart';

class CustomDescriptipnProduct extends StatelessWidget {
  const CustomDescriptipnProduct({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        product.description,
        style: Styles.textStyle10(context).copyWith(
          fontWeight: FontWeight.w400,
          color: Colors.grey,
        ),
        textAlign: TextAlign.left,
        softWrap: true,
        maxLines: null,
      ),
    );
  }
}
