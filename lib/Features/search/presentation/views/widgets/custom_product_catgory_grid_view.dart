import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_powered_ai/Features/home/data/models/product_models.dart';
import 'package:store_powered_ai/Features/home/presentation/manager/home_cubit.dart';
import 'package:store_powered_ai/Features/home/presentation/manager/home_state.dart';
import 'package:store_powered_ai/Features/home/presentation/views/widgets/custom_produt_card.dart';

class CustomProductCategoryGridView extends StatelessWidget {
  const CustomProductCategoryGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeCategoryLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is HomeCategoryLoaded) {
          List<ProductModel> products = state.products;

          if (products.isEmpty) {
            return const Center(child: Text("No products found."));
          }

          return GridView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.0,
              childAspectRatio: 0.65,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              return CustomProdutCard(
                width: 166,
                height: 170,
                isActive: false,
                product: products[index],  
                isSearchWithImage: false,
              );
            },
          );
        } else if (state is HomeCategoryError) {
          return Center(child: Text(state.errorMessage));
        }
        return const Center(child: Text("Something went wrong!"));
      },
    );
  }
}
