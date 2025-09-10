import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:store_powered_ai/Features/home/data/models/favorite_model.dart';
import 'package:store_powered_ai/Features/home/data/models/product_models.dart';
import 'package:store_powered_ai/Features/home/data/repo/home_repo.dart';
import 'package:store_powered_ai/core/error/failure.dart' show ServerFailure;
import 'package:store_powered_ai/core/network/api_endpoints.dart';
import 'package:store_powered_ai/core/network/dio_helper.dart';
import 'package:store_powered_ai/core/utils/cache_helper.dart';

class HomeRepoImpl implements HomeRepo {
  @override
  Future<List<ProductModel>> fetchProductsByCategory({
    required Map<String, dynamic> queryParams,
  }) async {
    try {
      log('''
🚀 Starting fetch with the following query parameters:
${queryParams.entries.map((e) => '🔹 ${e.key}: ${e.value}').join('\n')}
==============================
''');
      Response response = await DioHelper.getData(
        url: "/items",
        queryParameters: queryParams,
      );

      List<dynamic> data = response.data["data"]["items"];

      log("✅ Fetching products with ياااامسهلللل: $queryParams");

      return data.map((item) => ProductModel.fromJson(item)).toList();
    } on DioException catch (e) {
      final failure = ServerFailure.fromDioError(e);
      log("❌ Error fetching products with filters $queryParams: ${failure.errMessage}");
      throw Exception("Failed to fetch products: ${failure.errMessage}");
    }
  }

  @override
  Future<List<ProductModel>> fetchNewArrivals() async {
    //  try {
    Response response = await DioHelper.getData(url: "/items/new-arrivals");
    List<dynamic> data = response.data["data"]["items"];
    return data.map((item) => ProductModel.fromJson(item)).toList();
    // } catch (error) {
    //   log("❌ Error fetching new arrivals: $error");
    //   throw Exception("Failed to fetch new arrivals: $error");
    // }
  }

// get favorites
  @override
  Future<List<FavoriteModel>> getFavorites() async {
    try {
      final token = CacheHelper.getData(key: "token");
      final response = await DioHelper.getDataWithToken(
        url: "${ApiEndpoints.baseUrl}/favorites",
        token: token,
      );

      final favorites = response.data['data']['favorites'] as List;
      log("الفيففففف:$favorites");
      return favorites.map((json) {
        return FavoriteModel(
            id: json['_id'],
            name: json['name'] ?? '',
            img: json['img'],
            price: (json['price'] as num).toDouble(),
            description: json['description'],
            sizes: json['sizes']);
      }).toList();
    } catch (e) {
      log("Get favorites error: $e");
      rethrow;
    }
  }

  //addToFavorites
  @override
  Future<bool> addToFavorites(String itemId) async {
    try {
      Response response = await DioHelper.addToFavorites(itemId: itemId);
      if (response.statusCode == 200) {
        log("✅ Product added to favorites!");
        return true;
      }
      return false;
    } catch (error) {
      log("❌ Error adding product to favorites: $error");
      return false;
    }
  }

//removeFromFavorites
  @override
  Future<bool> removeFromFavorites(String itemId) async {
    try {
      Response response = await DioHelper.removeFromFavorites(itemId: itemId);
      if (response.statusCode == 200) {
        log("✅ Product removed from favorites!");
        return true;
      }
      return false;
    } catch (error) {
      log("❌ Error removing product from favorites: $error");
      return false;
    }
  }

  @override
  Future<ProductModel> getProductDetails({required String productId}) async {
    try {
      Response response =
          await DioHelper.getProductDetails(productId: productId);
      log('📥 Get product details Response: ${response.data}');

      final productJson = response.data["data"]["item"];
      return ProductModel.fromJson(productJson);
    } on DioException catch (e) {
      final errorMsg = e.response?.data["message"] ?? "Error fetching product.";
      throw Exception(errorMsg);
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }

  Future<List<RelatedProductModel>> getRelatedProducts(
      {required String productId}) async {
    try {
      final response = await DioHelper.getProductDetails(productId: productId);
      log('📥 Get related products Response: ${response.data}');

      final relatedItemsJson = response.data["data"]["relatedItems"] ?? [];
      return List<RelatedProductModel>.from(
        relatedItemsJson.map((item) => RelatedProductModel.fromJson(item)),
      );
    } on DioException catch (e) {
      final errorMsg =
          e.response?.data["message"] ?? "Error fetching related products.";
      throw Exception(errorMsg);
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }

  @override
  Future<List<ProductModel>> searchItems(String query) async {
    try {
      final response = await DioHelper.getData(
        url: "/items/search",
        queryParameters: {
          "query": query,
        },
      );

      final List<dynamic> data =
          response.data["data"]["items"]; // حسب هيكل الـ response
      return data.map((item) => ProductModel.fromJson(item)).toList();
    } on DioException catch (e) {
      final failure = ServerFailure.fromDioError(e);
      throw Exception("Search failed: ${failure.errMessage}");
    }
  }
}
