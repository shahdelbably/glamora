import 'package:flutter/material.dart';
import 'package:store_powered_ai/Features/cart/data/models/cart_model.dart';
import 'package:store_powered_ai/Features/payment/presentation/views/billing_details_view.dart';
import 'package:store_powered_ai/core/widgets/custom_button.dart';
import 'package:store_powered_ai/Features/cart/presentation/views/widgets/custom_coupon.dart';
import 'package:store_powered_ai/Features/cart/presentation/views/widgets/custom_text_order_summary.dart';
import 'package:store_powered_ai/core/utils/styles.dart';

class CustomCheckoutDetails extends StatefulWidget {
  const CustomCheckoutDetails({super.key, required this.cartModel});
  final CartModel cartModel;

  @override
  State<CustomCheckoutDetails> createState() => _CustomCheckoutDetailsState();
}

class _CustomCheckoutDetailsState extends State<CustomCheckoutDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 31,
        left: 16,
        right: 15,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? Theme.of(context).colorScheme.surface
            : Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
          bottomLeft: Radius.zero,
          bottomRight: Radius.zero,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 32.50,
            offset: Offset(0, 4),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomCoupon(
            onPressed: () {},
            onChanged: (value) {},
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            'Order Summary',
            style: Styles.textStyle16(context),
          ),
          CustomTextOrderSummary(
              text: 'Items',
              text2: '${calculateTotalItems(widget.cartModel.items)}'),
          CustomTextOrderSummary(
              text: 'Sub Total', text2: '\$${widget.cartModel.totalPrice}'),
          const CustomTextOrderSummary(text: 'Shipping', text2: '\$00.00'),
          const CustomTextOrderSummary(text: 'Taxes', text2: '\$00.00'),
          const CustomTextOrderSummary(
              text: 'Coupon Discount', text2: '\$00.00'),
          const SizedBox(
            height: 12,
          ),
          const Divider(
            color: Color(0xffEEECEF),
            thickness: 3,
          ),
          const SizedBox(
            height: 12,
          ),
          CustomTextOrderSummary(
              text: 'Total', text2: '\$${widget.cartModel.totalPrice}'),
          const SizedBox(
            height: 16,
          ),
          CustomButton(
            text: 'Checkout',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return BillingDetailsView(
                  cartModel: widget.cartModel,
                );
              }));
            },
          ),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }

  int calculateTotalItems(List<CartItemModel> items) {
    int totalitems = 0;

    for (var item in items) {
      totalitems += item.quantity;
    }

    return totalitems;
  }
}
