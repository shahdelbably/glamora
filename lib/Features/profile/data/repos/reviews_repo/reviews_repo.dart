import 'package:store_powered_ai/Features/profile/data/models/reviews_model.dart';

abstract class ReviewRepo {
  Future<ReviewsResponse> getReviews({required String productId});
  Future<void> postReview({
    required String itemId,
    required double rating,
    required String comment,
  });
}
