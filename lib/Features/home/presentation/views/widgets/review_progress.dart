import 'package:flutter/material.dart';
import 'package:store_powered_ai/core/utils/styles.dart';

class ReviewProgress extends StatelessWidget {
  const ReviewProgress(
      {super.key, required this.totalReviews, required this.ratingCounts});
  final int totalReviews;
  final Map<int, int> ratingCounts;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: 16,
          top: 8,
        ),
        child: Column(
          children: List.generate(5, (index) {
            int star = 5 - index;
            double percentage;
            totalReviews == 0
                ? percentage = 0
                : percentage = ratingCounts[star]! / totalReviews;
            return Column(
              children: [
                Row(
                  children: [
                    Text("$star Stars", style: Styles.textStyle12(context)),
                    const SizedBox(width: 23),
                    Expanded(
                      child: LinearProgressIndicator(
                        value: percentage,
                        backgroundColor: const Color(0xffE9E6EA),
                        color: Colors.black,
                        minHeight: 3,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 6,
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
