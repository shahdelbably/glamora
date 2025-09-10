import 'package:store_powered_ai/Features/home/data/models/favorite_model.dart';
import 'package:store_powered_ai/Features/home/data/models/product_models.dart';

abstract class HomeRepo {
  Future<List<ProductModel>> fetchProductsByCategory(
      {required Map<String, Object?> queryParams});
  Future<List<ProductModel>> fetchNewArrivals();

  // إضافة/إزالة المفضلة
  Future<bool> addToFavorites(String itemId);
  Future<bool> removeFromFavorites(String itemId);

  Future<List<FavoriteModel>> getFavorites();
  Future<ProductModel> getProductDetails({required String productId});
  Future<List<ProductModel>> searchItems(String query);
}
