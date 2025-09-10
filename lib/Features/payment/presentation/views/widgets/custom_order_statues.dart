import 'package:flutter/material.dart';
import 'package:store_powered_ai/Features/payment/presentation/views/widgets/custom_timeline_order_statues.dart';
import 'package:store_powered_ai/Features/profile/data/models/order_model.dart';
import 'package:store_powered_ai/core/utils/styles.dart';

class CustomOrderStatues extends StatelessWidget {
  const CustomOrderStatues({super.key, required this.orderModel});
  final OrderModel orderModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Order status',
          style:
              Styles.textStyle16(context).copyWith(fontWeight: FontWeight.w400),
        ),
        const SizedBox(
          height: 12,
        ),
        const CustomTimelineOrderStatues(),
      ],
    );
  }
}
