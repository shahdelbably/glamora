import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_powered_ai/Features/home/presentation/manager/home_cubit.dart';
import 'package:store_powered_ai/Features/home/presentation/manager/home_state.dart';
import 'package:store_powered_ai/Features/home/presentation/views/widgets/custom_rating.dart';
import 'package:store_powered_ai/Features/home/presentation/views/widgets/product_details_bottom_sheet.dart';
import 'package:store_powered_ai/Features/profile/data/models/order_model.dart';
import 'package:store_powered_ai/Features/profile/presentation/manger/reviews_cubit/reviews_cubit.dart';
import 'package:store_powered_ai/Features/profile/presentation/views/widgets/custom_appbar.dart';
import 'package:store_powered_ai/Features/profile/presentation/views/widgets/custom_divider.dart';
import 'package:store_powered_ai/Features/profile/presentation/views/widgets/my_orders_confirm_button.dart';
import 'package:store_powered_ai/Features/profile/presentation/views/widgets/orderdetails.dart';
import 'package:store_powered_ai/Features/profile/presentation/views/widgets/reviewtextfield.dart';

class LeaveReview extends StatefulWidget {
  const LeaveReview({super.key, required this.order});
  final OrderItemModel order;

  @override
  State<LeaveReview> createState() => _LeaveReviewState();
}

class _LeaveReviewState extends State<LeaveReview> {
  final TextEditingController _commentController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  double reviewRating = 0;
  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ProfileCustomAppBar(title: 'Leave Review'),
      body: Padding(
        padding: const EdgeInsets.only(right: 10.0, left: 10.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 18),
                      OrderDetails(
                        orderModel: widget.order,
                        buttonText: 'Re-Order',
                        onPressed: () {
                          context.read<ProductDetailsCubit>().getProductDetails(
                              productId: widget.order.product.id);
                          showModalBottomSheet(
                              isScrollControlled: true,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(50),
                                  topRight: Radius.circular(50),
                                ),
                              ),
                              context: context,
                              builder: (context) {
                                return BlocBuilder<ProductDetailsCubit,
                                    HomeState>(builder: (context, state) {
                                  if (state is ProductDetailsLoaded) {
                                    return ProductDetailsBottomSheet(
                                        isActive: false,
                                        product: state.productDetails);
                                  } else {
                                    return const SizedBox();
                                  }
                                });
                              });
                        },
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'How is your order?',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 24),
                      const CustomDivider(),
                      const SizedBox(height: 18),
                      const Text(
                        'Your overall rating',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 18),
                      CustomRating2(
                        size: 40,
                        onRatingUpdate: (rating) {
                          reviewRating = rating;
                        },
                      ),
                      const SizedBox(height: 18),
                      const CustomDivider(),
                      const SizedBox(height: 18),
                      const Padding(
                        padding: EdgeInsets.only(left: 18.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Add detailed review',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 18),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SizedBox(
                          height: 150, // Set the height as needed
                          child: ReviewTextField(
                            controller: _commentController,
                          ),
                        ),
                      ),
                      const SizedBox(height: 18),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    right: 10.0, left: 10.0, bottom: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BlocConsumer<ReviewsCubit, ReviewsState>(
                      listener: (context, state) {
                        if (state is ReviewLoaded) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Sucess, Add Review!')),
                          );
                          Navigator.pop(context);
                        } else if (state is ReviewFailure) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text(
                                    'Failed, Try Again: ${state.errorMessage}')),
                          );
                        }
                      },
                      builder: (context, state) {
                        final isLoading = state is ReviewLoading;

                        return MyOrdersConfirmButton(
                          color: Colors.black,
                          text: 'Submit',
                          onPressed: isLoading
                              ? null
                              : () {
                                  if (_formKey.currentState!.validate()) {
                                    final comment = _commentController.text;
                                    BlocProvider.of<ReviewsCubit>(context)
                                        .postReviews(
                                            itemId: widget.order.product.id,
                                            rating: reviewRating,
                                            comment: comment);
                                  }
                                },
                        );
                      },
                    ),
                    const SizedBox(width: 10.0),
                    MyOrdersConfirmButton(
                      color: Colors.grey,
                      text: 'Cancel',
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
