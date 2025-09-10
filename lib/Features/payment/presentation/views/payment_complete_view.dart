import 'package:flutter/material.dart';
import 'package:store_powered_ai/Features/payment/presentation/views/widgets/payment_complete_view_body.dart';
import 'package:store_powered_ai/Features/profile/data/models/order_model.dart';
import 'package:store_powered_ai/core/utils/styles.dart';

class PaymentCompleteView extends StatelessWidget {
  const PaymentCompleteView({super.key, required this.orderModel});
  final OrderModel orderModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Payment',
          style: Styles.textStyle16(context).copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            size: 26,
            color: Theme.of(context).textTheme.bodyLarge?.color,
          ),
        ),
      ),
      body: PaymentCompleteViewBody(
        orderModel: orderModel,
      ),
    );
  }
}
