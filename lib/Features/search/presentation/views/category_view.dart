// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_powered_ai/Features/filter/presentation/manger/models/filter_model.dart';
import 'package:store_powered_ai/Features/filter/presentation/views/filter_view.dart';
import 'package:store_powered_ai/Features/home/data/models/product_models.dart';
import 'package:store_powered_ai/Features/home/presentation/manager/home_cubit.dart';
import 'package:store_powered_ai/Features/home/presentation/manager/home_state.dart';
import 'package:store_powered_ai/Features/home/presentation/views/widgets/custom_produt_card.dart';

class CategoryView extends StatefulWidget {
  final String title;

  final String? subCategory;

  final List<String>? colors;
  final List<String>? sizes;
  final List<String>? brands;
  final RangeValues? priceRange;
  final String gender;

  const CategoryView({
    super.key,
    required this.title,
    this.subCategory,
    this.colors,
    this.sizes,
    this.brands,
    this.priceRange,
    required this.gender,
  });

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  late String categoryKey;
  ProductFilters? _filters;

  @override
  void initState() {
    super.initState();

    categoryKey = widget.subCategory != null
        ? widget.title // الجندر هنا سيكون 'male' أو 'female'
        : widget.gender;

    _filters = ProductFilters(
      brand: widget.brands?.join(', '),
      color: widget.colors?.join(', '),
      sizes: widget.sizes,
      priceRange: widget.priceRange != null
          ? '${widget.priceRange!.start}-${widget.priceRange!.end}'
          : null,
    );

    _fetchData();
  }

  void _fetchData() {
    if (widget.title == 'New Arrivals') {
      context.read<NewArrivalsCubit>().getNewArrivals();
    } else if (widget.subCategory == null) {
      context.read<CategoriesCubit>().getProductsByCategories(
            gender: widget.gender,
            filters: _filters,
          );
    } else if (widget.subCategory != null) {
      context.read<CategoriesCubit>().getProductsByCategories(
            category: categoryKey,
            filters: _filters,
          );
    }
  }

  Future<void> _openFilterPage() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const FilterView(),
      ),
    );

    if (result != null && result is ProductFilters) {
      setState(() {
        _filters = result;
      });

      // هنا بناءً على إذا كان subCategory null أو لا، نمرر category أو gender
      if (widget.subCategory == null) {
        context.read<CategoriesCubit>().getProductsByCategories(
              gender: categoryKey,
              filters: _filters,
            );
      } else {
        context.read<CategoriesCubit>().getProductsByCategories(
              category: categoryKey,
              filters: _filters,
            );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.subCategory != null ? widget.title : widget.title),
        actions: widget.title == 'New Arrivals' ||
                widget.title == 'Recommended for you'
            ? null
            : [
                IconButton(
                  onPressed: _openFilterPage,
                  icon: const Icon(Icons.filter_list),
                ),
              ],
      ),
      body: widget.title == 'Recommended for you' ||
              widget.title == 'New Arrivals' ||
              widget.title == 'Top Trends'
          ? BlocBuilder<NewArrivalsCubit, HomeState>(builder: (context, state) {
              if (state is HomeNewArrivalsLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is HomeNewArrivalsLoaded) {
                return _buildGridView(state.newArrivals);
              } else if (state is HomeNewArrivalsError) {
                return Center(child: Text(state.errorMessage));
              }
              return const Center(child: Text("No products available."));
            })
          : BlocBuilder<CategoriesCubit, HomeState>(builder: (context, state) {
              if (state is HomeCategoryLoading &&
                  state.categoryName == categoryKey) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is HomeCategoryLoaded &&
                  state.categoryName == categoryKey) {
                return _buildGridView(state.products);
              } else if (state is HomeCategoryError &&
                  state.categoryName == categoryKey) {
                return Center(child: Text(state.errorMessage));
              }
              return const Center(child: Text("No products available."));
            }),
    );
  }

  Widget _buildGridView(List<ProductModel> products) {
    if (products.isEmpty) {
      return const Center(child: Text("No products found."));
    }

    return GridView.builder(
      padding: const EdgeInsets.all(16.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        childAspectRatio: 0.75,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return CustomProdutCard(
          width: 150,
          height: 200,
          isActive: false,
          product: products[index],
          isSearchWithImage: false,
          returnScreen:
              CategoryView(title: widget.title, gender: widget.gender),
        );
      },
    );
  }
}
