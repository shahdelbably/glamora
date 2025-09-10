import 'package:flutter/material.dart';
import 'package:store_powered_ai/Features/profile/data/models/order_model.dart';
import 'package:store_powered_ai/Features/profile/presentation/views/order_details_view.dart';
import 'package:store_powered_ai/Features/profile/presentation/views/widgets/orderdetails.dart';

class CancelledOrder extends StatelessWidget {
  const CancelledOrder({super.key, required this.orders});
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
                    isCancel: true,
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
// import 'package:store_powered_ai/Features/home/presentation/views/widgets/product_details_bottom_sheet.dart';
// import 'package:store_powered_ai/Features/profile/data/models/order_model.dart';
// import 'package:store_powered_ai/Features/profile/presentation/views/widgets/orderdetails.dart';

// class CancelledOrder extends StatelessWidget {
//   const CancelledOrder({super.key, required this.orders});
//   final List<OrderModel> orders;
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: SingleChildScrollView(
//         child: Column(
//           children: List.generate(orders.length, (index) {
//             return OrderDetails(
//               orderModel: orders[index],
//               buttonText: 'Re-Order',
//               onPressed: () {
//                 showModalBottomSheet(
//                     isScrollControlled: true,
//                     shape: const RoundedRectangleBorder(
//                       borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(50),
//                         topRight: Radius.circular(50),
//                       ),
//                     ),
//                     context: context,
//                     builder: (context) {
//                       return ProductDetailsBottomSheet(
//                           isActive: false, product: [] as dynamic);
//                     });
//               },
//             );
//           }),
//         ),
//       ),
//     );
//   }
// }
