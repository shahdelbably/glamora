import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomRating extends StatelessWidget {
  const CustomRating({super.key, required this.size, required this.rating});

  final int size;
  final int rating;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: rating.toDouble(),
      itemSize: size.toDouble(),
      direction: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.yellow,
      ),
    );
  }
}

class CustomRating2 extends StatelessWidget {
  const CustomRating2({
    super.key,
    required this.size,
    required this.onRatingUpdate,
  });

  final int size;
  final void Function(double) onRatingUpdate;
  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: 0,
      itemSize: size.toDouble(),
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.yellow,
      ),
      onRatingUpdate: onRatingUpdate,
    );
  }
}
