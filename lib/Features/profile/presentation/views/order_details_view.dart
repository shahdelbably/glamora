import 'package:flutter/material.dart';
import 'package:store_powered_ai/Features/profile/data/models/order_model.dart';
import 'package:store_powered_ai/Features/profile/presentation/views/widgets/custom_appbar.dart';
import 'package:store_powered_ai/Features/profile/presentation/views/widgets/order_details_view_body.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({
    super.key,
    required this.orderModel,
    required this.isCancel,
  });
  final OrderModel orderModel;
  final bool isCancel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ProfileCustomAppBar(
        title: 'Order Details',
      ),
      body: OrderDetailsViewBody(
        orderModel: orderModel,
        isCanceled: isCancel,
      ),
    );
  }
}
