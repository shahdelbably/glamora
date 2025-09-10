import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_powered_ai/Features/home/data/models/product_models.dart';
import 'package:store_powered_ai/Features/home/presentation/views/widgets/custom_drop_down_button.dart';
import 'package:store_powered_ai/Features/home/presentation/views/widgets/custom_rating.dart';
import 'package:store_powered_ai/Features/home/presentation/views/widgets/custom_reviews_list_view.dart';
import 'package:store_powered_ai/Features/home/presentation/views/widgets/review_progress.dart';
import 'package:store_powered_ai/Features/profile/data/models/reviews_model.dart';
import 'package:store_powered_ai/Features/profile/presentation/manger/reviews_cubit/reviews_cubit.dart';
import 'package:store_powered_ai/core/utils/styles.dart';

class CustomReviewProduct extends StatefulWidget {
  const CustomReviewProduct({super.key, required this.product});
  final ProductModel product;

  @override
  State<CustomReviewProduct> createState() => _CustomReviewProductState();
}

class _CustomReviewProductState extends State<CustomReviewProduct> {
  String selectedSort = 'Newest';
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReviewsCubit, ReviewsState>(
      listener: (context, state) {
        if (state is ReviewFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error: ${state.errorMessage}'),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is ReviewLoading) {
          return const Center(
              child: SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2.5,
            ),
          ));
        } else if (state is ReviewFailure) {
          return SizedBox(
            child: Text(state.errorMessage),
          );
        } else if (state is ReviewSuccess) {
          List<ReviewModel> sortedReviews = [...state.reviews.reviews];

          // 👈 الترتيب حسب الاختيار
          sortedReviews.sort((a, b) {
            DateTime dateA = DateTime.parse(a.createdAt);
            DateTime dateB = DateTime.parse(b.createdAt);

            if (selectedSort == 'Newest') {
              return dateB.compareTo(dateA); // الأحدث أولًا
            } else {
              return dateA.compareTo(dateB); // الأقدم أولًا
            }
          });
          return state.reviews.reviews.isEmpty
              ? Center(
                  child: Text(
                    'No reviews found yet.',
                    style: Styles.textStyle10(context),
                  ),
                )
              : Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '${calculateAverageRating(state.reviews.reviews)} Out of 5',
                              style: Styles.textStyle18(context).copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            CustomRating(
                              size: 12,
                              rating:
                                  calculateAverageRating(state.reviews.reviews)
                                      .toInt(),
                            ),
                            Text(
                              '(${state.reviews.results} Reviews)',
                              style: Styles.textStyle12(context).copyWith(
                                color: const Color(0xff7B7B7B),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 116,
                          child: VerticalDivider(
                            indent: 0,
                            endIndent: 0,
                            color: Color(0xffE9E6EA),
                            thickness: 2,
                          ),
                        ),
                        ReviewProgress(
                          totalReviews: state.reviews.results.toInt(),
                          ratingCounts: calculateRatingCounts(
                            state.reviews.reviews,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Row(
                    //       children: [
                    //         Text(
                    //           'Review List',
                    //           style:
                    //               Styles.textStyle12.copyWith(fontWeight: FontWeight.w500),
                    //         ),
                    //         const SizedBox(
                    //           width: 4,
                    //         ),
                    //         Text(
                    //           '(Showing 1-4 of 24 results)',
                    //           style: Styles.textStyle9.copyWith(
                    //             color: const Color(0xff6E685F),
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //     const Row(
                    //       children: [
                    //         Text(
                    //           'Sort by :',
                    //           style: Styles.textStyle11,
                    //         ),
                    //         SizedBox(
                    //           width: 4,
                    //         ),
                    //         CustomDropDownButton(),
                    //       ],
                    //     ),
                    //   ],
                    // ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Wrap(
                                spacing: 4,
                                children: [
                                  Text(
                                    'Review List',
                                    style: Styles.textStyle12(context)
                                        .copyWith(fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    state.reviews.results > 4
                                        ? '(Showing 1-4 of ${state.reviews.results} results)'
                                        : '(Showing ${state.reviews.results} results)',
                                    style: Styles.textStyle9(context).copyWith(
                                      color: const Color(0xff6E685F),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 8),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Sort by :',
                                  style: Styles.textStyle11(context),
                                ),
                                const SizedBox(width: 4),
                                CustomDropDownButton(
                                  onChanged: (value) {
                                    setState(() {
                                      selectedSort = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 16,
                    ),
                    CustomReviewsListView(
                      reviews: sortedReviews,
                      itemCount: state.reviews.results.toInt(),
                    ),
                  ],
                );
        } else {
          return const SizedBox();
        }
      },
    );
  }

  double calculateAverageRating(List<ReviewModel> reviews) {
    if (reviews.isEmpty) {
      return 0;
    }

    double totalRating = 0.0;
    for (var review in reviews) {
      totalRating += review.rating;
    }

    return totalRating / reviews.length;
  }

  Map<int, int> calculateRatingCounts(List<ReviewModel> reviews) {
    Map<int, int> ratingCounts = {
      0: 0, // 0 <= rating < 1
      1: 0, // 1 <= rating < 2
      2: 0, // 2 <= rating < 3
      3: 0, // 3 <= rating < 4
      4: 0, // 4 <= rating < 5
      5: 0, // rating == 5
    };

    for (var review in reviews) {
      double rating = review.rating;

      if (rating == 5.0) {
        ratingCounts[5] = ratingCounts[5]! + 1;
      } else if (rating >= 4.0) {
        ratingCounts[4] = ratingCounts[4]! + 1;
      } else if (rating >= 3.0) {
        ratingCounts[3] = ratingCounts[3]! + 1;
      } else if (rating >= 2.0) {
        ratingCounts[2] = ratingCounts[2]! + 1;
      } else if (rating >= 1.0) {
        ratingCounts[1] = ratingCounts[1]! + 1;
      } else {
        ratingCounts[0] = ratingCounts[0]! + 1;
      }
    }

    return ratingCounts;
  }
}
