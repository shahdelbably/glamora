part of 'cart_cubit.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final GetCartResponse cart;
  CartLoaded(this.cart);
}

class CartSuccess extends CartState {}

class CartFailure extends CartState {
  final String error;
  CartFailure(this.error);
}
