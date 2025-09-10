import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_powered_ai/Features/home/presentation/manager/home_cubit.dart';
import 'package:store_powered_ai/Features/home/presentation/manager/home_state.dart';
import 'package:store_powered_ai/Features/home/presentation/views/widgets/product_details_bottom_sheet.dart';
import 'package:store_powered_ai/Features/profile/data/models/order_model.dart';
import 'package:store_powered_ai/Features/profile/presentation/views/leave_review.dart';
import 'package:store_powered_ai/Features/profile/presentation/views/widgets/orderdetails.dart';

class OrderDetailsViewBody extends StatelessWidget {
  const OrderDetailsViewBody(
      {super.key, required this.orderModel, required this.isCanceled});
  final OrderModel orderModel;
  final bool isCanceled;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: List.generate(orderModel.items.length, (index) {
            return isCanceled
                ? OrderDetails(
                    orderModel: orderModel.items[index],
                    buttonText: 'Re-Order',
                    onPressed: () {
                      context.read<ProductDetailsCubit>().getProductDetails(
                          productId: orderModel.items[index].product.id);
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
                            return BlocBuilder<ProductDetailsCubit, HomeState>(
                                builder: (context, state) {
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
                  )
                : OrderDetails(
                    orderModel: orderModel.items[index],
                    buttonText: 'Leave Review',
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LeaveReview(
                                    order: orderModel.items[index],
                                  )));
                    },
                  );
          }),
        ),
      ),
    );
  }
}
