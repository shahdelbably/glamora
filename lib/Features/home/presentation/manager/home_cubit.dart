import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_powered_ai/Features/filter/presentation/manger/models/filter_model.dart';
import 'package:store_powered_ai/Features/home/data/models/favorite_model.dart';
import 'package:store_powered_ai/Features/home/data/models/product_models.dart';
import 'package:store_powered_ai/Features/home/data/repo/home_repo.dart';
import 'package:store_powered_ai/Features/home/data/repo/home_repo__imp.dart';
import 'package:store_powered_ai/Features/home/presentation/manager/home_state.dart';
import 'package:store_powered_ai/core/error/failure.dart';

class NewArrivalsCubit extends Cubit<HomeState> {
  final HomeRepo homeRepo;
  List<ProductModel>? newArrivalsCache;

  NewArrivalsCubit(this.homeRepo) : super(HomeInitial());

  /// **📌 جلب بيانات New Arrivals**
  void getNewArrivals() async {
    // ✅ استخدام الكاش إذا كانت البيانات موجودة مسبقًا
    if (newArrivalsCache != null) {
      log("Using cached New Arrivals data."); // Debugging
      emit(HomeNewArrivalsLoaded(newArrivalsCache!));
      return;
    }

    emit(HomeNewArrivalsLoading()); // ✅ عرض حالة التحميل
    try {
      log("Fetching New Arrivals data from repository..."); // Debugging
      final newArrivals = await homeRepo.fetchNewArrivals();

      // ✅ التحقق من البيانات الفارغة
      if (newArrivals.isEmpty) {
        emit(HomeNewArrivalsError("No new arrivals found."));
        return;
      }

      newArrivalsCache = newArrivals; // ✅ تخزين البيانات في الكاش
      emit(HomeNewArrivalsLoaded(newArrivals));
      log("New Arrivals data loaded successfully."); // Debugging
    } on DioException catch (e) {
      final failure = ServerFailure.fromDioError(e);
      log("Error fetching New Arrivals: ${failure.errMessage}");
      emit(HomeNewArrivalsError(failure.errMessage));
    }
    // catch (e){
    //   emit(HomeNewArrivalsError("Failed to load new products , please try later!"));

    // }
  }
}

class CategoriesCubit extends Cubit<HomeState> {
  final HomeRepo homeRepo;
  Map<String, List<ProductModel>> categoryCache = {};

  CategoriesCubit(this.homeRepo) : super(HomeInitial());

  void getProductsByCategories({
    String? gender,
    String? category,
    ProductFilters? filters,
  }) async {
    final Map<String, dynamic> queryParams = {
      if (gender != null) 'gender': gender,
      if (category != null) 'category': category,
      ...?filters?.toQueryParameters(),
    };

    final identifier = category ?? gender ?? "unknown";

    final cacheKey = '$identifier-${filters?.cacheKey ?? "no-filters"}';

    if (categoryCache.containsKey(cacheKey)) {
      emit(HomeCategoryLoaded(identifier, categoryCache[cacheKey]!));
      return;
    }

    emit(HomeCategoryLoading(identifier));

    try {
      final products = await homeRepo.fetchProductsByCategory(
        queryParams: queryParams,
      );

      if (products.isEmpty) {
        emit(HomeCategoryError(identifier, "No products found."));
      } else {
        categoryCache[cacheKey] = products;
        emit(HomeCategoryLoaded(identifier, products));
      }
    } catch (e) {
      emit(HomeCategoryError(identifier, e.toString()));
    }
  }
}

class FavouriteCubit extends Cubit<HomeState> {
  final HomeRepo homeRepo;
  final Set<FavoriteModel> favoriteProducts = {};

  FavouriteCubit(this.homeRepo) : super(HomeInitial());

  Future<void> getFavorites() async {
    final products =
        await homeRepo.getFavorites(); // لازم يرجع List<ProductModel>

    try {
      // جلب بيانات المنتجات المفضلة من الـ API
      await homeRepo.getFavorites();

      // تفريغ القائمة القديمة
      favoriteProducts
        ..clear()
        ..addAll(products); // إضافة المنتجات كلها

      log("✅ Loaded ${favoriteProducts.length} favorite items.");

      emit(HomeFavoriteUpdated());
    } catch (e) {
      log("❌ Failed to load favorites: $e");
      emit(HomeFavoriteError("Failed to load favorites: $e"));
    }
  }

  void addToFavorites(String itemId, String name, String img) async {
    // Optimistic update
    final favoriteProduct = FavoriteModel(
        id: itemId, name: name, img: img, price: 0, description: '', sizes: []);
    favoriteProducts.add(favoriteProduct);
    emit(HomeFavoriteUpdated());

    try {
      final success = await homeRepo.addToFavorites(itemId);
      if (!success) {
        // Rollback
        favoriteProducts.removeWhere((product) => product.id == itemId);
        emit(HomeFavoriteError("Failed to add to favorites"));
        emit(HomeFavoriteUpdated()); // لإعادة بناء الواجهة
      }
    } catch (e) {
      // Rollback
      favoriteProducts.removeWhere((product) => product.id == itemId);
      emit(HomeFavoriteError("Error: $e"));
      emit(HomeFavoriteUpdated());
    }
  }

  void removeFromFavorites(String itemId) async {
    // Optimistic update
    final removed = favoriteProducts.firstWhere(
      (product) => product.id == itemId,
      orElse: () => FavoriteModel(
          id: itemId, name: '', img: '', price: 0, description: '', sizes: []),
    );
    favoriteProducts.removeWhere((product) => product.id == itemId);
    emit(HomeFavoriteUpdated());

    try {
      final success = await homeRepo.removeFromFavorites(itemId);
      if (!success) {
        // Rollback
        favoriteProducts.add(removed);
        emit(HomeFavoriteError("Failed to remove from favorites"));
        emit(HomeFavoriteUpdated());
      }
    } catch (e) {
      // Rollback
      favoriteProducts.add(removed);
      emit(HomeFavoriteError("Error: $e"));
      emit(HomeFavoriteUpdated());
    }
  }

  bool isProductFavorite(String itemId) {
    return favoriteProducts.any((product) => product.id == itemId);
  }
}

class ProductDetailsCubit extends Cubit<HomeState> {
  final HomeRepo homeRepo;

  ProductDetailsCubit(this.homeRepo) : super(HomeInitial());
  Future<void> getProductDetails({required String productId}) async {
    emit(ProductDetailsLoading());
    try {
      final ProductModel productDetails =
          await homeRepo.getProductDetails(productId: productId);
      log('$productDetails');
      emit(ProductDetailsLoaded(productDetails));
    } catch (e) {
      emit(ProductDetailsError(e.toString()));
    }
  }

  Future<void> getRelatedProducts({required String productId}) async {
    emit(RelatedProductsLoading());
    try {
      final relatedProducts =
          await HomeRepoImpl().getRelatedProducts(productId: productId);
      emit(RelatedProductsLoaded(relatedProducts));
    } catch (e) {
      emit(RelatedProductsError(e.toString()));
    }
  }
}

class SearchCubit extends Cubit<SearchState> {
  final HomeRepo homeRepo;

  SearchCubit(this.homeRepo) : super(SearchInitial());

  Future<void> search(String query) async {
    emit(SearchLoading());
    try {
      final results = await homeRepo.searchItems(query);
      emit(SearchSuccess(results));
    } catch (e) {
      emit(SearchError(e.toString()));
    }
  }
}
