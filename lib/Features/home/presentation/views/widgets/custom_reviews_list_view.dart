import 'package:flutter/material.dart';
import 'package:store_powered_ai/Features/home/presentation/views/widgets/custom_review_container.dart';
import 'package:store_powered_ai/Features/profile/data/models/reviews_model.dart';
import 'package:store_powered_ai/core/utils/styles.dart';

class CustomReviewsListView extends StatefulWidget {
  const CustomReviewsListView(
      {super.key, required this.reviews, required this.itemCount});
  final List<ReviewModel> reviews;
  final int itemCount;
  @override
  State<CustomReviewsListView> createState() => _CustomReviewsListViewState();
}

bool isSeeMore = true;

class _CustomReviewsListViewState extends State<CustomReviewsListView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        isSeeMore
            ? ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.itemCount,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: CustomReviewContainer(
                      review: widget.reviews[index],
                    ),
                  );
                },
              )
            : ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.itemCount,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: CustomReviewContainer(
                      review: widget.reviews[index],
                    ),
                  );
                },
              ),
        widget.itemCount > 4
            ? Column(
                children: [
                  const SizedBox(
                    height: 3,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        isSeeMore
                            ? Text(
                                'SeeMore',
                                style: Styles.textStyle12(context)
                                    .copyWith(fontWeight: FontWeight.w500),
                              )
                            : Text(
                                'SeeLess',
                                style: Styles.textStyle12(context)
                                    .copyWith(fontWeight: FontWeight.w500),
                              ),
                        IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            setState(() {
                              isSeeMore = !isSeeMore;
                            });
                          },
                          icon: isSeeMore
                              ? const Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 16,
                                )
                              : const Icon(
                                  Icons.keyboard_arrow_up,
                                  size: 16,
                                ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : Container(),
      ],
    );
  }
}
