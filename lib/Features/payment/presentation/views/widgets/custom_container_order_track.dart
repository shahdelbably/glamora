import 'package:flutter/material.dart';
import 'package:store_powered_ai/Features/profile/data/models/order_model.dart';
import 'package:store_powered_ai/core/utils/styles.dart';

class CustomContinerOrderTrack extends StatelessWidget {
  const CustomContinerOrderTrack({super.key, required this.orderItemModel});
  final OrderItemModel orderItemModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            orderItemModel.product.img,
            fit: BoxFit.cover,
            width: 70,
            height: 70,
            errorBuilder: (context, error, stackTrace) {
              return const Icon(Icons.broken_image,
                  size: 50, color: Colors.grey);
            },
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              orderItemModel.product.name,
              style: Styles.textStyle12(context).copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              'Color: ${orderItemModel.color}',
              style: Styles.textStyle8(context),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              'Size: ${orderItemModel.size}',
              style: Styles.textStyle8(context),
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Text(
                  'Brand: ${orderItemModel.brand.brandName}',
                  style: Styles.textStyle8(context),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
