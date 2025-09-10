import 'package:flutter/material.dart';
import 'package:store_powered_ai/Features/home/data/models/product_models.dart';
import 'package:store_powered_ai/Features/home/presentation/views/widgets/custom_related_product_container.dart';

class CustomRelatedProductListView extends StatelessWidget {
  final List<ProductModel> relatedProducts;

  const CustomRelatedProductListView({
    super.key,
    required this.relatedProducts,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
      ),
      child: SizedBox(
        height: 200,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: relatedProducts.length, // عدد المنتجات
          itemBuilder: (context, index) {
            final product = relatedProducts[index]; // المنتج الحالي
            return Padding(
              padding: const EdgeInsets.only(
                right: 12,
              ),
              child: ProductDetailsBottomSheet(
                isActive: false,
                product: product,
              ),
            );
          },
        ),
      ),
    );
  }
}
