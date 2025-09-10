import 'package:flutter/material.dart';
import 'package:store_powered_ai/Features/payment/presentation/views/widgets/custom_container_order_track.dart';
import 'package:store_powered_ai/Features/profile/data/models/order_model.dart';

class CustomOrderListView extends StatelessWidget {
  const CustomOrderListView({super.key, required this.orderModel});
  final OrderModel orderModel;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: orderModel.items.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(
            bottom: 16,
          ),
          child: CustomContinerOrderTrack(
            orderItemModel: orderModel.items[index],
          ),
        );
      },
    );
  }
}
