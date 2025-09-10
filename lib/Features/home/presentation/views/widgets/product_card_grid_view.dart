// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_powered_ai/Features/home/data/models/product_models.dart';
import 'package:store_powered_ai/Features/home/data/repo/home_repo.dart';
import 'package:store_powered_ai/Features/home/presentation/manager/home_cubit.dart';
import 'package:store_powered_ai/Features/home/presentation/views/widgets/custom_produt_card.dart';

class ProductCardGridView extends StatelessWidget {
  ProductCardGridView(
      {super.key, required this.products, required this.isSearchWithImage});

  final List<ProductModel> products;
  bool isSearchWithImage = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavouriteCubit(HomeRepo as HomeRepo),
      child: GridView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12.0,
          childAspectRatio: 0.65,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return CustomProdutCard(
            width: 200,
            height: 300,
            isActive: true,
            product: products[index],
            isSearchWithImage: isSearchWithImage,
          );
        },
      ),
    );
  }
}
