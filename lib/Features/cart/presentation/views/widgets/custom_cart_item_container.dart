import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_powered_ai/Features/cart/data/models/cart_model.dart';
import 'package:store_powered_ai/Features/cart/presentation/manger/cart_cubit/cart_cubit.dart';
import 'package:store_powered_ai/core/utils/styles.dart';

class CustomCartItemContainer extends StatelessWidget {
  const CustomCartItemContainer({super.key, required this.cartItem});
  final CartItemModel cartItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 15),
      child: Container(
        padding: const EdgeInsets.only(bottom: 16),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Color(0xffE9E6EA),
              width: 1.5,
            ),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                cartItem.productImage,
                fit: BoxFit.cover,
                width: 70,
                height: 70,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.broken_image,
                      size: 50, color: Colors.grey);
                },
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          cartItem.productName,
                          overflow: TextOverflow.ellipsis,
                          style: Styles.textStyle15(context)
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                      ),
                      const SizedBox(width: 11),
                      Text(
                        "\$${cartItem.price.toString()}",
                        style: Styles.textStyle12(context)
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Color: ${cartItem.color}',
                              style: Styles.textStyle11(context)),
                          const SizedBox(height: 4),
                          Text('Size: ${cartItem.size}',
                              style: Styles.textStyle11(context)),
                          const SizedBox(height: 4),
                          // Row(
                          //   children: [
                          //     Text('Brand: ${cartItem.brand}',
                          //         style: Styles.textStyle11(context)),
                          //   ],
                          // ),
                        ],
                      ),
                      const Spacer(), // Adds space between the text and the buttons
                      CustomPlusAndMinusItemCount(cartItem: cartItem),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomPlusAndMinusItemCount extends StatefulWidget {
  const CustomPlusAndMinusItemCount({super.key, required this.cartItem});
  final CartItemModel cartItem;

  @override
  State<CustomPlusAndMinusItemCount> createState() =>
      _CustomPlusAndMinusItemCountState();
}

class _CustomPlusAndMinusItemCountState
    extends State<CustomPlusAndMinusItemCount> {
  late int localQuantity;

  @override
  void initState() {
    super.initState();
    localQuantity = widget.cartItem.quantity;
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CartCubit>();
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Error : ${state.error}")),
          );
        }
      },
      builder: (context, state) {
        return Row(
          children: [
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: localQuantity > 1
                  ? () {
                      final previousQuantity = localQuantity;
                      setState(() {
                        localQuantity--;
                      });
                      cubit.changeItemQuantity(
                        productId: widget.cartItem.productId,
                        changeType: "decrease",
                        onFailure: () {
                          setState(() {
                            localQuantity = previousQuantity;
                          });
                        },
                      );
                    }
                  : null,
              icon: Icon(
                Icons.remove_circle_outline,
                color: widget.cartItem.quantity == 1
                    ? const Color(0xff92929D)
                    : Colors.black,
              ),
            ),
            Text(
              localQuantity.toString(),
              style: Styles.textStyle16(context).copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                final previousQuantity = localQuantity;
                setState(() {
                  localQuantity++;
                });
                cubit.changeItemQuantity(
                  productId: widget.cartItem.productId,
                  changeType: "increase",
                  onFailure: () {
                    setState(() {
                      localQuantity = previousQuantity;
                    });
                  },
                );
              },
              icon: const Icon(Icons.add_circle_outline),
            ),
          ],
        );
      },
    );
  }
}
