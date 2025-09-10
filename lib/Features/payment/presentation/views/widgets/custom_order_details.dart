import 'package:flutter/material.dart';
import 'package:store_powered_ai/Features/profile/data/models/order_model.dart';
import 'package:store_powered_ai/core/utils/styles.dart';
import 'package:intl/intl.dart';

class CustomOrderDetails extends StatelessWidget {
  const CustomOrderDetails({super.key, required this.orderModel});
  final OrderModel orderModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Order Details',
          style:
              Styles.textStyle16(context).copyWith(fontWeight: FontWeight.w400),
        ),
        CustomTextOrderDetails(detailsName: 'Order ID', details: orderModel.id),
        CustomTextOrderDetails(
            detailsName: 'Payment Method',
            details:
                orderModel.paymentMethod?.methodName ?? 'Cash On Delivary'),
        //  CustomTextOrderDetails(
        //     detailsName: 'Transaction ID', details: ''),
        CustomTextOrderDetails(
            detailsName: 'Estimated Delivery Date',
            details: orderModel.estimatedDate == 'UnKown'
                ? 'UnKown'
                : DateFormat('d MMMM yyyy').format(
                    DateTime.parse(orderModel.estimatedDate).toLocal())),
      ],
    );
  }
}

class CustomTextOrderDetails extends StatelessWidget {
  const CustomTextOrderDetails(
      {super.key, required this.detailsName, required this.details});
  final String detailsName;
  final String details;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              detailsName,
              style: Styles.textStyle12(context).copyWith(
                color: const Color(0xff717070),
              ),
            ),
            Text(
              details,
              style: Styles.textStyle12(context),
            )
          ],
        ),
      ],
    );
  }
}
