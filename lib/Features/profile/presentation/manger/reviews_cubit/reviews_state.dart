part of 'reviews_cubit.dart';

@immutable
abstract class ReviewsState {}

final class ReviewsInitial extends ReviewsState {}

class ReviewLoading extends ReviewsState {}

class ReviewSuccess extends ReviewsState {
  final ReviewsResponse reviews;

  ReviewSuccess({required this.reviews});
}

class ReviewLoaded extends ReviewsState {}

class ReviewFailure extends ReviewsState {
  final String errorMessage;

  ReviewFailure({required this.errorMessage});
}
