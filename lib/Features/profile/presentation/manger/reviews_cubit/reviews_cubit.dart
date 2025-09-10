import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:store_powered_ai/Features/profile/data/models/reviews_model.dart';
import 'package:store_powered_ai/Features/profile/data/repos/reviews_repo/reviews_repo.dart';
part 'reviews_state.dart';

class ReviewsCubit extends Cubit<ReviewsState> {
  ReviewsCubit({required this.reviewRepo}) : super(ReviewsInitial());
  final ReviewRepo reviewRepo;
  Future<void> getReviews({required String productId}) async {
    emit(ReviewLoading());

    try {
      final ReviewsResponse reviews =
          await reviewRepo.getReviews(productId: productId);
      log('$reviews');
      emit(ReviewSuccess(reviews: reviews));
    } catch (e) {
      emit(ReviewFailure(errorMessage: e.toString()));
    }
  }

  void postReviews(
      {required String itemId,
      required double rating,
      required String comment}) async {
    emit(ReviewLoading());
    try {
      await reviewRepo.postReview(
        itemId: itemId,
        rating: rating,
        comment: comment,
      );
      emit(ReviewLoaded());
    } catch (e) {
      emit(ReviewFailure(errorMessage: e.toString()));
    }
  }
}
