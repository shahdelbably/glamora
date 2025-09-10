
import 'package:flutter/material.dart';
import 'package:store_powered_ai/Features/home/data/models/product_models.dart';
import 'package:store_powered_ai/Features/home/presentation/views/widgets/custom_rating.dart';
import 'package:store_powered_ai/core/utils/styles.dart';

class ProductDatailsSectionOne extends StatelessWidget {
  final ProductModel product;

  const ProductDatailsSectionOne({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SizedBox(
                  height: 44,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: product.images.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: Image.network(
                            product.images[index],
                            fit: BoxFit.cover,
                            width: 44,
                            height: 44,
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(Icons.broken_image,
                                  size: 44, color: Colors.grey);
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                '(In Stock)',
                style: Styles.textStyle14(context).copyWith(
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff92929D),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                product.name,
                style: Styles.textStyle18(context),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(width: 14),
              CustomRating(
                size: 12,
                rating: product.rating.toInt(),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //SizedBox(),
              const Text('Unknown Brand'),
              Text(
                '\$${product.price}',
                style: Styles.textStyle16(context),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'Product Details:',
            style: Styles.textStyle14(context)
                .copyWith(fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 4),
          Text(
            product.description,
            style: Styles.textStyle12(context)
                .copyWith(color: const Color(0xff92929D)),
          ),
        ],
      ),
    );
  }
}
