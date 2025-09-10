// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';

import 'package:store_powered_ai/Features/home/data/models/favorite_model.dart';
import 'package:store_powered_ai/Features/home/data/models/product_models.dart';
import 'package:store_powered_ai/Features/home/presentation/views/widgets/custom_produt_card.dart';

class CustomProductFavoriteGridView extends StatelessWidget {
  CustomProductFavoriteGridView(
      {super.key, required this.favoriteItems, this.isSearchWithImage = false});
  final List<FavoriteModel> favoriteItems;
  bool isSearchWithImage;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.0,
        childAspectRatio: 0.65,
      ),
      itemCount: favoriteItems.length,
      itemBuilder: (context, index) {
        final favoriteItem = favoriteItems[index];
        final product = ProductModel(
            id: favoriteItem.id,
            name: favoriteItem.name,
            price: favoriteItem.price,
            img: favoriteItem.img,
            description: '',
            categoryField: '',
            rating: 0,
            colors: [],
            countryOfOrigin: '',
            createdAt: DateTime.now(),
            gender: '',
            images: [],
            featured: false,
            material: '',
            reviewCount: 0,
            seller: '',
            sizes: favoriteItem.sizes.cast<String>(),
            updatedAt: DateTime.now(),
            clothingType: '',
            relatedItems: []);
        return CustomProdutCard(
          width: 166,
          height: 170,
          isActive: true,
          product: product,
          isSearchWithImage: isSearchWithImage,
        );
      },
    );
  }
}
