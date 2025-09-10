// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:store_powered_ai/Features/home/data/models/product_models.dart';
import 'package:store_powered_ai/Features/home/presentation/views/widgets/custom_rating.dart';
import 'package:store_powered_ai/Features/home/presentation/views/widgets/fav_icon.dart';
import 'package:store_powered_ai/Features/home/presentation/views/widgets/product_details_bottom_sheet.dart';

class CustomProdutCard extends StatelessWidget {
  CustomProdutCard({
    super.key,
    required this.width,
    required this.height,
    required this.isActive,
    required this.product,
    this.returnScreen,
    this.isSearchWithImage = false,
  });
  final double width;
  final double height;
  final bool isActive;
  final ProductModel product;
  bool isSearchWithImage;
  final Widget? returnScreen;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
          ),
          context: context,
          builder: (context) {
            return ProductDetailsBottomSheet(
              isActive: isActive,
              product: product,
            );
          },
        );
      },
      child: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    product.img,
                    height: height * 0.55,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;

                      return Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  (loadingProgress.expectedTotalBytes ?? 1)
                              : null,
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      log("❌ Error loading image: $error");
                      return const Icon(Icons.broken_image,
                          size: 50, color: Colors.grey);
                    },
                  ),
                ),
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: isSearchWithImage == false
                        ? FavoriteIcon(
                            product: product,
                            returnScreen: returnScreen,
                          )
                        : const SizedBox()),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              product.name,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.bodyLarge?.color,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomRating(size: 13, rating: product.rating.toInt()),
                Text(
                  '\$${product.price.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
