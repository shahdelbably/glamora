import 'package:store_powered_ai/Features/profile/data/models/order_model.dart';

abstract class OrdersRepo {
  Future<OrderModel> postOrder({
    required String addressId,
    required String paymentId,
    required String cartId,
  });
  Future<GetOrdersResponseModel> getOrders();
}
