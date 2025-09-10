import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:store_powered_ai/Features/profile/data/models/order_model.dart';
import 'package:store_powered_ai/Features/profile/data/repos/orders_repo/orders_repo.dart';
import 'package:store_powered_ai/core/network/dio_helper.dart';
import 'package:store_powered_ai/core/utils/cache_helper.dart';

class OrdersRepoImpl implements OrdersRepo {
  @override
  Future<OrderModel> postOrder({
    required String addressId,
    required String paymentId,
    required String cartId,
  }) async {
    try {
      final Map<String, dynamic> data = {
        "addressId": addressId,
        "paymentId": paymentId,
        "cartId": cartId,
      };

      final response = await DioHelper.postOrders(data: data);
      log("✅ Order posted successfully with data: $data");
      final model = PostOrderResponseModel.fromJson(response.data);
      return model.order;
    } on DioException catch (e) {
      final errorMsg = e.response?.data["message"] ?? "Post Order failed.";
      throw Exception(errorMsg);
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }

  @override
  Future<GetOrdersResponseModel> getOrders() async {
    try {
      final token = CacheHelper.getData(key: 'token');
      DioHelper.dio.options.headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      };

      Response response = await DioHelper.getOrders();
      log("✅ Orders fetched: ${response.data}");

      return GetOrdersResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      final errorMsg = e.response?.data["message"] ?? "Error fetching order.";
      throw Exception(errorMsg);
    } catch (e) {
      if (e.toString() == 'No orders found') {
        throw Exception("$e yet!");
      }
      throw Exception("Unexpected error: $e");
    }
  }
}
