import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_powered_ai/Features/home/data/models/product_models.dart';
import 'package:store_powered_ai/Features/home/presentation/views/widgets/custom_addtional_information_product.dart';
import 'package:store_powered_ai/Features/home/presentation/views/widgets/custom_descriptipn_product.dart';
import 'package:store_powered_ai/Features/home/presentation/views/widgets/custom_review_product.dart';
import 'package:store_powered_ai/Features/profile/presentation/manger/reviews_cubit/reviews_cubit.dart';
import 'package:store_powered_ai/core/utils/styles.dart';

class CustomTapBarProductDaetails extends StatefulWidget {
  const CustomTapBarProductDaetails({
    super.key,
    required this.product,
  });
  final ProductModel product;
  @override
  State<CustomTapBarProductDaetails> createState() =>
      _CustomTapBarProductDaetailsState();
}

class _CustomTapBarProductDaetailsState
    extends State<CustomTapBarProductDaetails> {
  int _selectedIndex = 0;

  final List<String> _tabs = [
    "Description",
    "Additional Information",
    "Review"
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 15,
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: 2,
                color: Colors.grey,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(_tabs.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedIndex = index;
                      });
                      if (index == 2) {
                        context
                            .read<ReviewsCubit>()
                            .getReviews(productId: widget.product.id);
                      }
                    },
                    child: Column(
                      children: [
                        Text(
                          _tabs[index],
                          style: Styles.textStyle12(context).copyWith(
                            color: _selectedIndex == index
                                ? Theme.of(context).textTheme.bodyLarge?.color
                                : Colors.grey,
                          ),
                        ),
                        const SizedBox(
                          height: 9,
                        ),
                        Container(
                          height: 2,
                          color: _selectedIndex == index
                              ? Colors.black
                              : Colors.transparent,
                          width: _getTextWidth(context, _tabs[index]),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          if (_selectedIndex == 0)
            CustomDescriptipnProduct(
              product: widget.product,
            ),
          if (_selectedIndex == 1)
            CustomAddtionalInformationProduct(
              product: widget.product,
            ),
          if (_selectedIndex == 2)
            CustomReviewProduct(
              product: widget.product,
            ),
        ],
      ),
    );
  }

  double _getTextWidth(BuildContext context, String text) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: Styles.textStyle12(context),
      ),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size.width * 1.05;
  }
}
