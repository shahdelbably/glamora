part of 'orders_cubit.dart';

@immutable
abstract class OrdersState {}

final class OrdersInitial extends OrdersState {}

class OrdersLoading extends OrdersState {}

class OrdersSuccess extends OrdersState {
  final OrderModel orders;

  OrdersSuccess({required this.orders});
}

class OrdersLoaded extends OrdersState {
  final List<OrderModel> orders;

  OrdersLoaded({required this.orders});
}

class OrdersFailure extends OrdersState {
  final String errorMessage;

  OrdersFailure({required this.errorMessage});
}
