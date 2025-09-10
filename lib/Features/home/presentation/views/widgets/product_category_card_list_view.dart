// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:store_powered_ai/Features/home/data/models/product_models.dart';
// import 'package:store_powered_ai/Features/home/presentation/manager/home_cubit.dart';
// import 'package:store_powered_ai/Features/home/presentation/views/widgets/custom_produt_card.dart';
// import 'package:store_powered_ai/Features/search/presentation/views/category_view.dart';
// import 'package:store_powered_ai/core/utils/styles.dart';

// class ProductCatogaryCardListView extends StatelessWidget {
//   const ProductCatogaryCardListView({super.key, required this.categoryName});

//   final String categoryName;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               categoryName,
//               style: Styles.textStyle16.copyWith(
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//             GestureDetector(
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) {
//                   return CategoryView(title: categoryName);
//                 }));
//               },
//               child: Text(
//                 'See more',
//                 style: Styles.textStyle12.copyWith(
//                   fontWeight: FontWeight.w500,
//                   color: const Color(0xff92929D),
//                 ),
//               ),
//             ),
//           ],
//         ),
//         const SizedBox(height: 12),
//         SizedBox(
//           height: 200,
//           child: BlocBuilder<HomeCubit, HomeState>(
//             builder: (context, state) {
//               if (state is HomeLoading) {
//                 return const Center(child: CircularProgressIndicator());
//               } else if (state is HomeLoaded) {
//                 List<ProductModel> categoryProducts = state.products
//                     .where((product) => product.category == categoryName)
//                     .toList();

//                 if (categoryProducts.isEmpty) {
//                   return const Center(child: Text("No products found."));
//                 }

//                 return ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   physics: const BouncingScrollPhysics(),
//                   itemCount: categoryProducts.length,
//                   itemBuilder: (context, index) {
//                     return Padding(
//                       padding: const EdgeInsets.only(right: 13),
//                       child: CustomProdutCard(
//                         height: 140,
//                         width: 140,
//                         isActive: false,
//                         product: categoryProducts[index], // ✅ تمرير المنتج الفعلي
//                       ),
//                     );
//                   },
//                 );
//               } else if (state is HomeError) {
//                 return Center(child: Text(state.errorMessage));
//               }
//               return const Center(child: Text("Something went wrong!"));
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_powered_ai/Features/home/presentation/manager/home_cubit.dart';
import 'package:store_powered_ai/Features/home/data/models/product_models.dart';
import 'package:store_powered_ai/Features/home/presentation/manager/home_state.dart';
import 'package:store_powered_ai/Features/home/presentation/views/home_view.dart';
import 'package:store_powered_ai/Features/home/presentation/views/widgets/custom_produt_card.dart';
import 'package:store_powered_ai/Features/search/presentation/views/category_view.dart';

class ProductCatogaryCardListView extends StatelessWidget {
  const ProductCatogaryCardListView({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    context.read<NewArrivalsCubit>().getNewArrivals();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.bodyLarge?.color,
              ),
            ),
            GestureDetector(
              onTap: () {
                //final newArrivals = context.read<NewArrivalsCubit>().newArrivalsCache;

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoryView(
                      title: title,
                      gender: 'female',
                    ),
                  ),
                );
              },
              child: const Text(
                'See more',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff92929D),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        BlocBuilder<NewArrivalsCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeNewArrivalsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is HomeNewArrivalsLoaded) {
              return _buildProductList(state.newArrivals);
            } else if (state is HomeNewArrivalsError) {
              return Center(child: Text(state.errorMessage));
            }

            return const SizedBox(); // إذا لم تكن هناك بيانات متاحة
          },
        ),
      ],
    );
  }

  Widget _buildProductList(List<ProductModel> products) {
    if (products.isEmpty) {
      return const Center(child: Text("No products found."));
    }

    // Debugging: طباعة عدد المنتجات
    log("Number of products in New Arrivals: ${products.length}");

    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 13),
            child: CustomProdutCard(
              width: 150,
              height: 200,
              isActive: false,
              product: products[index],
              isSearchWithImage: false,
              returnScreen: const HomeView(),
            ),
          );
        },
      ),
    );
  }
}
