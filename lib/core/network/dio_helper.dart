import 'package:dio/dio.dart';
import 'package:store_powered_ai/core/network/api_endpoints.dart';
import 'package:store_powered_ai/core/utils/cache_helper.dart';

class DioHelper {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://clothes-server-production.up.railway.app/api/v1",
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  static Map<String, String> _buildAuthHeaders({bool isFormData = false}) {
    final token = CacheHelper.getData(key: "token");
    return {
      'Content-Type': isFormData ? 'multipart/form-data' : 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

//
  static Future<Response> patchDataWithToken({
    required String url,
    required Map<String, dynamic> data,
  }) async {
    String? token = CacheHelper.getData(key: 'token');

    dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    return await dio.patch(url, data: data);
  }

  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
  }) async {
    return await dio.post(url, data: data);
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await dio.get(url, queryParameters: queryParameters);
  }

  static Future<Response> getDataWithToken({
    required String url,
    Map<String, dynamic>? queryParameters,
    String? token,
  }) async {
    dio.options.headers = _buildAuthHeaders();

    return await dio.get(url, queryParameters: queryParameters);
  }

  static Future<Response> postCart({
    required Map<String, dynamic> data,
  }) async {
    dio.options.headers = _buildAuthHeaders();

    return await dio.post(ApiEndpoints.cart, data: data);
  }

  static Future<Response> getCart() async {
    dio.options.headers = _buildAuthHeaders();

    return await dio.get(ApiEndpoints.cart);
  }

  static Future<Response> deleteFromCart({
    required String productId,
  }) async {
    dio.options.headers = _buildAuthHeaders();

    return await dio.delete('${ApiEndpoints.cart}/$productId');
  }

  static Future<Response> patchCartItemQuantity({
    required String productIdd,
    required Map<String, dynamic> data,
  }) async {
    dio.options.headers = _buildAuthHeaders();

    return await dio.patch('${ApiEndpoints.cart}/$productIdd', data: data);
  }

// post favorites
  static Future<Response> addToFavorites({
    required String itemId,
  }) async {
    dio.options.headers = _buildAuthHeaders();

    return await dio.post(
      "${ApiEndpoints.favorite}/$itemId",
    );
  }

//remove from favorites
  static Future<Response> removeFromFavorites({
    required String itemId,
  }) async {
    dio.options.headers = _buildAuthHeaders();

    return await dio.delete(
      "${ApiEndpoints.favorite}/$itemId", // التأكد من المسار الصحيح
    );
  }

  static Future<Response> postAddresses({
    required Map<String, dynamic> data,
  }) async {
    dio.options.headers = _buildAuthHeaders();
    return await dio.post(ApiEndpoints.addresses, data: data);
  }

  static Future<Response> getAddresses() async {
    dio.options.headers = _buildAuthHeaders();
    return await dio.get(ApiEndpoints.addresses);
  }

  static Future<Response> patchAddress({
    required String id,
    required Map<String, dynamic> data,
  }) async {
    dio.options.headers = _buildAuthHeaders();
    return await dio.patch('${ApiEndpoints.addresses}/$id', data: data);
  }

  static Future<Response> getReviews({
    required String productId,
  }) async {
    dio.options.headers = _buildAuthHeaders();
    return await dio.get('${ApiEndpoints.reviews}/$productId');
  }

  static Future<Response> postReviews({
    required Map<String, dynamic> data,
  }) async {
    dio.options.headers = _buildAuthHeaders();
    return await dio.post(
      ApiEndpoints.reviews,
      data: data,
    );
  }

  static Future<Response> patchFormData({
    required String url,
    required FormData formData,
  }) async {
    dio.options.headers = _buildAuthHeaders(isFormData: true);
    return await dio.patch(url, data: formData);
  }

// ✨ جلب بيانات البروفايل
  static Future<Response> getProfile() async {
    dio.options.headers = _buildAuthHeaders();
    return await dio.get(ApiEndpoints.getProfile);
  }

  static Future<Response> deleteProfile() async {
    dio.options.headers = _buildAuthHeaders();
    return await dio.delete(ApiEndpoints.deleteProfile);
  }

  static Future<Response> postPaymentCards({
    required Map<String, dynamic> data,
  }) async {
    dio.options.headers = _buildAuthHeaders();
    return await dio.post(ApiEndpoints.paymentCards, data: data);
  }

  static Future<Response> getPaymentCards() async {
    dio.options.headers = _buildAuthHeaders();
    return await dio.get(ApiEndpoints.paymentCards);
  }

  static Future<Response> postOrders({
    required Map<String, dynamic> data,
  }) async {
    dio.options.headers = _buildAuthHeaders();
    return await dio.post(ApiEndpoints.postOrders, data: data);
  }

  static Future<Response> getOrders() async {
    dio.options.headers = _buildAuthHeaders();
    return await dio.get(
      ApiEndpoints.myOrders,
    );
  }

  static Future<Response> getProductDetails({
    required String productId,
  }) async {
    return await dio.get('${ApiEndpoints.items}/$productId');
  }

  static Future<Response> postRetrieve({
    required dynamic data,
    bool isFormData = false,
  }) async {
    return await dio.post(
      'https://lately-humane-swan.ngrok-free.app/retrieve',
      data: data, // ✅ استخدمي data مباشرة بدون FormData.fromMap
      options: Options(
        headers: {
          'Content-Type':
              isFormData ? 'multipart/form-data' : 'application/json',
          'accept': 'application/json',
        },
      ),
    );
  }

  Future<Response> postpayment({
    required body,
    required String url,
    required String token,
    String? contentType,
    Map<String, String>? headers,
  }) async {
    var response = await dio.post(
      url,
      data: body,
      options: Options(
        contentType: contentType,
        headers: headers ?? {'Authorization': 'Bearer $token'},
      ),
    );
    return response;
  }
}
