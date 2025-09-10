import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:store_powered_ai/Features/profile/data/models/order_model.dart';
import 'package:store_powered_ai/Features/profile/data/repos/orders_repo/orders_repo.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit(this.ordersRepo) : super(OrdersInitial());
  final OrdersRepo ordersRepo;
  Future<void> postOrder({
    required String addressId,
    required String paymentId,
    required String cartId,
  }) async {
    emit(OrdersLoading());
    try {
      final order = await ordersRepo.postOrder(
        addressId: addressId,
        paymentId: paymentId,
        cartId: cartId,
      );
      emit(OrdersSuccess(orders: order));
    } catch (e) {
      emit(OrdersFailure(errorMessage: e.toString()));
    }
  }

  Future<void> getOrders() async {
    emit(OrdersLoading());

    try {
      final getOrdersResponseModel = await ordersRepo.getOrders();
      final orders = getOrdersResponseModel.orders;
      log(orders.toString());
      emit(OrdersLoaded(orders: orders));
    } catch (e) {
      emit(OrdersFailure(errorMessage: e.toString()));
    }
  }
}
