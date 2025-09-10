import 'package:flutter/material.dart';
import 'package:store_powered_ai/Features/profile/data/models/order_model.dart';
import 'package:store_powered_ai/Features/profile/presentation/views/widgets/custom_divider.dart';
import 'package:store_powered_ai/Features/profile/presentation/views/widgets/myordersbutton.dart';
import 'package:store_powered_ai/core/utils/styles.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({
    super.key,
    required this.buttonText,
    required this.onPressed,
    required this.orderModel,
  });

  final String buttonText;
  final void Function()? onPressed;
  final OrderItemModel orderModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  orderModel.product.img,
                  fit: BoxFit.cover,
                  width: 70,
                  height: 70,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.broken_image,
                        size: 50, color: Colors.grey);
                  },
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          orderModel.product.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 4),
                        Text('Color: ${orderModel.color}',
                            style: Styles.textStyle8(context)),
                        const SizedBox(height: 4),
                        Text('Size: ${orderModel.size}',
                            style: Styles.textStyle8(context)),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Text('Brand: ${orderModel.brand.brandName}',
                                style: Styles.textStyle8(context)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              MyOrderMainButton(
                text: buttonText,
                onPressed: onPressed,
              ),
            ],
          ),
        ),
        const CustomDivider(),
      ],
    );
  }
}
