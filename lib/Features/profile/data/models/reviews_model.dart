import 'package:store_powered_ai/Features/authentication/data/models/user_model.dart';

class ReviewsResponse {
  final String status;
  final int results;
  final List<ReviewModel> reviews;

  ReviewsResponse({
    required this.status,
    required this.results,
    required this.reviews,
  });

  factory ReviewsResponse.fromJson(Map<String, dynamic> json) {
    return ReviewsResponse(
      status: json['status'],
      results: (json['results'] as num).toInt(),
      reviews: List<ReviewModel>.from(
        (json['data']['reviews'] as List).map((e) => ReviewModel.fromJson(e)),
      ),
    );
  }
}

class ReviewModel {
  final String id;
  final UserModel user;
  final double rating;
  final String comment;
  final String createdAt;
  final String updatedAt;

  ReviewModel({
    required this.id,
    required this.user,
    required this.rating,
    required this.comment,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: json['_id'],
      user: UserModel.fromJson(json['user']),
      rating: (json['rating'] as num).toDouble(),
      comment: json['comment'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}
