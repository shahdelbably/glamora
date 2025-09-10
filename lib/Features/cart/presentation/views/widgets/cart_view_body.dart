import 'package:flutter/material.dart';
import 'package:store_powered_ai/Features/cart/data/models/cart_model.dart';
import 'package:store_powered_ai/Features/cart/presentation/views/widgets/custom_checkout_details.dart';
import 'package:store_powered_ai/Features/cart/presentation/views/widgets/custom_cart_items_list_view.dart';
import 'package:store_powered_ai/core/utils/styles.dart';

class CartViewBody extends StatefulWidget {
  const CartViewBody(
      {super.key, required this.onPressed, required this.cartModel});
  final CartModel cartModel;
  final void Function() onPressed;
  @override
  State<CartViewBody> createState() => _CartViewBodyState();
}

class _CartViewBodyState extends State<CartViewBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: widget.onPressed,
                  icon: Icon(
                    Icons.arrow_back,
                    size: 26,
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                  ),
                ),
                Text(
                  'Cart',
                  style: Styles.textStyle22(context),
                ),
                Container(),
              ],
            ),
          ),
          CustomCartItemsListView(
            cartItems: widget.cartModel.items,
          ),
          CustomCheckoutDetails(
            cartModel: widget.cartModel,
          ),
          const SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }
}
