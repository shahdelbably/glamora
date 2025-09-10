import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:store_powered_ai/Features/profile/data/models/reviews_model.dart';
import 'package:store_powered_ai/Features/profile/data/repos/reviews_repo/reviews_repo.dart';
import 'package:store_powered_ai/core/network/dio_helper.dart';
import 'package:store_powered_ai/core/utils/cache_helper.dart';

class ReviewRepoImpl implements ReviewRepo {
  @override
  Future<ReviewsResponse> getReviews({required String productId}) async {
    try {
      final token = CacheHelper.getData(key: 'token');
      DioHelper.dio.options.headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      };

      Response response = await DioHelper.getReviews(productId: productId);
      log('📥 Get Reviews Response: ${response.data}');

      return ReviewsResponse.fromJson(response.data);
    } on DioException catch (e) {
      final errorMsg = e.response?.data["message"] ?? "Error fetching reviews.";
      throw Exception(errorMsg);
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }

  @override
  Future<void> postReview(
      {required String itemId,
      required double rating,
      required String comment}) async {
    try {
      final Map<String, dynamic> data = {
        "itemId": itemId,
        "rating": rating,
        "comment": comment,
      };

      await DioHelper.postReviews(data: data);
    } on DioException catch (e) {
      final errorMsg = e.response?.data["message"] ?? "Leave review failed.";
      throw Exception(errorMsg);
    }
  }
}
