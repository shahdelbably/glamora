import 'package:flutter/material.dart';
import 'package:store_powered_ai/Features/home/data/models/favorite_model.dart';
import 'package:store_powered_ai/Features/home/presentation/views/widgets/custom_product_favorite_grid_view.dart';
import 'package:store_powered_ai/core/widgets/custom_app_bar.dart';

class FavoriteViewBody extends StatelessWidget {
  const FavoriteViewBody({super.key, required this.favoriteItems});
  final List<FavoriteModel> favoriteItems;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SafeArea(
            child: CustomAppBar(
              pageName: 'Favorite',
            ),
          ),
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomProductFavoriteGridView(
              favoriteItems: favoriteItems,
              isSearchWithImage: false,
            ),
          )
        ],
      ),
    );
  }
}
