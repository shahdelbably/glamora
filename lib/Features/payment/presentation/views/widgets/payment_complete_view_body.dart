import 'package:flutter/material.dart';
import 'package:store_powered_ai/Features/payment/presentation/views/track_order_view.dart';
import 'package:store_powered_ai/Features/profile/data/models/order_model.dart';
import 'package:store_powered_ai/core/utils/styles.dart';
import 'package:store_powered_ai/core/widgets/custom_button.dart';

class PaymentCompleteViewBody extends StatelessWidget {
  const PaymentCompleteViewBody({super.key, required this.orderModel});
  final OrderModel orderModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 15,
      ),
      child: Column(
        children: [
          const Spacer(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/dashicons_yes.png'),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Your order is completed!',
                  style: Styles.textStyle18(context),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'Thank you. Your order has been received.',
                  style: Styles.textStyle12(context).copyWith(
                    color: const Color(0xff92929D),
                  ),
                )
              ],
            ),
          ),
          const Spacer(),
          CustomButton(
              text: 'Track Order',
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return TrackOrderView(
                    orderModel: orderModel,
                  );
                }));
              }),
          const SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }
}
