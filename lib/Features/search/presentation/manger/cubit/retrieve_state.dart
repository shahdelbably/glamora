part of 'retrieve_cubit.dart';

@immutable
sealed class RetrieveState {}

final class RetrieveInitial extends RetrieveState {}

class RetrieveLoading extends RetrieveState {}

class RetrieveSuccess extends RetrieveState {
  final List<ProductModel> products;

  RetrieveSuccess(this.products);
}

class RetrieveFailure extends RetrieveState {
  final String error;

  RetrieveFailure(this.error);
}
