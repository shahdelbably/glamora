import 'package:store_powered_ai/Features/home/data/models/product_models.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

/// **🔹 حالات New Arrivals**
class HomeNewArrivalsLoading extends HomeState {}

class HomeNewArrivalsLoaded extends HomeState {
  final List<ProductModel> newArrivals;

  HomeNewArrivalsLoaded(this.newArrivals);
}

class HomeNewArrivalsError extends HomeState {
  final String errorMessage;

  HomeNewArrivalsError(this.errorMessage);
}

/// **🔹 حالات Categories**
class HomeCategoryLoading extends HomeState {
  final String categoryName;

  HomeCategoryLoading(this.categoryName);
}

class HomeCategoryLoaded extends HomeState {
  final String categoryName;
  final List<ProductModel> products;

  HomeCategoryLoaded(this.categoryName, this.products);
}

class HomeCategoryError extends HomeState {
  final String categoryName;
  final String errorMessage;

  HomeCategoryError(this.categoryName, this.errorMessage);
}

class HomeFavoriteUpdated extends HomeState {}

class HomeFavoriteError extends HomeState {
  final String errorMessage;

  HomeFavoriteError(this.errorMessage);
}

/// **🔹 حالات New Arrivals**
class ProductDetailsLoading extends HomeState {}

class ProductDetailsLoaded extends HomeState {
  final ProductModel productDetails;

  ProductDetailsLoaded(this.productDetails);
}

class ProductDetailsError extends HomeState {
  final String errorMessage;

  ProductDetailsError(this.errorMessage);
}

class RelatedProductsLoading extends HomeState {}

class RelatedProductsLoaded extends HomeState {
  final List<RelatedProductModel> relatedProducts;
  RelatedProductsLoaded(this.relatedProducts);
}

class RelatedProductsError extends HomeState {
  final String message;
  RelatedProductsError(this.message);
}



abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  final List<ProductModel> results;

  SearchSuccess(this.results);
}

class SearchError extends SearchState {
  final String message;

  SearchError(this.message);
}