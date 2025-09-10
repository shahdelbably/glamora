import 'package:flutter/material.dart';
import 'package:store_powered_ai/Features/payment/presentation/views/track_order_view.dart';
import 'package:store_powered_ai/Features/profile/data/models/order_model.dart';
import 'package:store_powered_ai/Features/profile/presentation/views/widgets/orderdetails.dart';

class ActiveOrder extends StatelessWidget {
  const ActiveOrder({
    super.key,
    required this.orders,
  });
  final List<OrderModel> orders;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: List.generate(orders.length, (index) {
            return OrderDetails(
              orderModel: orders[index].items.first,
              buttonText: 'Track Order',
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return TrackOrderView(
                    orderModel: orders[index],
                  );
                }));
              },
            );
          }),
        ),
      ),
    );
  }
}
