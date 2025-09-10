import 'package:flutter/material.dart';
import 'package:store_powered_ai/Features/payment/presentation/views/widgets/custom_order_details.dart';
import 'package:store_powered_ai/Features/payment/presentation/views/widgets/custom_order_list_view.dart';
import 'package:store_powered_ai/Features/payment/presentation/views/widgets/custom_order_statues.dart';
import 'package:store_powered_ai/Features/profile/data/models/order_model.dart';

class TrackOrderViewBody extends StatelessWidget {
  const TrackOrderViewBody({super.key, required this.orderModel});
  final OrderModel orderModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 15,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomOrderListView(orderModel: orderModel),
            const Divider(
              thickness: 1.5,
              color: Color(0xffE9E6EA),
            ),
            const SizedBox(
              height: 16,
            ),
            CustomOrderDetails(orderModel: orderModel),
            const SizedBox(
              height: 16,
            ),
            const Divider(
              thickness: 1.5,
              color: Color(0xffE9E6EA),
            ),
            const SizedBox(
              height: 16,
            ),
            CustomOrderStatues(orderModel: orderModel)
          ],
        ),
      ),
    );
  }
}
