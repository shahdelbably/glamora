import 'package:flutter/material.dart';
import 'package:store_powered_ai/Features/profile/data/models/order_model.dart';
import 'package:store_powered_ai/Features/profile/presentation/views/order_details_view.dart';
import 'package:store_powered_ai/Features/profile/presentation/views/widgets/orderdetails.dart';

class CompletedOrder extends StatelessWidget {
  const CompletedOrder({super.key, required this.orders});
  final List<OrderModel> orders;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: List.generate(orders.length, (index) {
            return OrderDetails(
              orderModel: orders[index].items.first,
              buttonText: 'Order Details',
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return OrderDetailsView(
                    orderModel: orders[index],
                    isCancel: false,
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

// import 'package:flutter/material.dart';
// import 'package:store_powered_ai/Features/profile/data/models/order_model.dart';
// import 'package:store_powered_ai/Features/profile/presentation/views/leave_review.dart';
// import 'package:store_powered_ai/Features/profile/presentation/views/widgets/orderdetails.dart';

// class CompletedOrder extends StatelessWidget {
//   const CompletedOrder({super.key, required this.orders});
//   final List<OrderModel> orders;
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: SingleChildScrollView(
//         child: Column(
//           children: List.generate(orders.length, (index) {
//             return OrderDetails(
//               orderModel: orders[index],
//               buttonText: 'Leave Review',
//               onPressed: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => LeaveReview(
//                               orders: orders[index],
//                             )));
//               },
//             );
//           }),
//         ),
//       ),
//     );
//   }
// }
