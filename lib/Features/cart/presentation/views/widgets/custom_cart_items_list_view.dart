import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:store_powered_ai/Features/cart/data/models/cart_model.dart';
import 'package:store_powered_ai/Features/cart/presentation/manger/cart_cubit/cart_cubit.dart';
import 'package:store_powered_ai/Features/cart/presentation/views/widgets/custom_cart_item_container.dart';
import 'package:store_powered_ai/core/utils/asset_data.dart';

class CustomCartItemsListView extends StatefulWidget {
  const CustomCartItemsListView({super.key, required this.cartItems});
  final List<CartItemModel> cartItems;

  @override
  State<CustomCartItemsListView> createState() =>
      _CustomCartItemsListViewState();
}

class _CustomCartItemsListViewState extends State<CustomCartItemsListView> {
  void _deleteItem(int index) {
    setState(() {
      widget.cartItems.removeAt(index); // حذف العنصر من القائمة
    });
  }

  @override
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.45,
      child: ListView.builder(
        itemCount: widget.cartItems.length,
        itemBuilder: (context, index) {
          return BlocConsumer<CartCubit, CartState>(
            listener: (context, state) {
              if (state is CartSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Success, deleting item")),
                );
              } else if (state is CartFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Error: ${state.error}')),
                );
              }
            },
            builder: (context, state) {
              return SwipeActionCell(
                key: ValueKey(widget.cartItems[index]),
                trailingActions: [
                  SwipeAction(
                    widthSpace: 47,
                    icon: Image.asset(AssetsData.iconDelete),
                    onTap: (swipeAction) {
                      context.read<CartCubit>().deleteFromCart(
                            productId: widget.cartItems[index].productId,
                          );
                      _deleteItem(index);
                    },
                    color: const Color(0xffffc7c8),
                  ),
                ],
                child: CustomCartItemContainer(
                  cartItem: widget.cartItems[index],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
