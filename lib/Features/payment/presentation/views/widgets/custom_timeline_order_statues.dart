import 'package:flutter/material.dart';
import 'package:store_powered_ai/Features/payment/data/models/order_statues_models.dart';
import 'package:store_powered_ai/core/utils/asset_data.dart';
import 'package:store_powered_ai/core/utils/styles.dart';
import 'package:timeline_tile/timeline_tile.dart';

class CustomTimelineOrderStatues extends StatefulWidget {
  const CustomTimelineOrderStatues({super.key});

  @override
  State<CustomTimelineOrderStatues> createState() =>
      _CustomTimelineOrderStatuesState();
}

class _CustomTimelineOrderStatuesState
    extends State<CustomTimelineOrderStatues> {
  final List<OrderStatuesModels> steps = [
    OrderStatuesModels(
        orderState: "Order Placed",
        time: "5 November 2024 - 02:00 PM",
        isCompleted: true),
    OrderStatuesModels(
        orderState: "Accepted",
        time: "5 November 2024 - 02:15 PM",
        isCompleted: true),
    OrderStatuesModels(
        orderState: "On the Way",
        time: "Expected - 6 November 2024",
        isCompleted: false),
    OrderStatuesModels(
        orderState: "In Progress",
        time: "Expected - 7/8 November 2024",
        isCompleted: false),
    OrderStatuesModels(
        orderState: "Delivered",
        time: "Expected - 9 November 2024",
        isCompleted: false),
  ];
  final List<String> icons = [
    AssetsData.orderPlacedIcon,
    AssetsData.acceptedIcon,
    AssetsData.inProgressIcon,
    AssetsData.onTheWayIcon,
    AssetsData.deliveredIcon,
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: steps.length,
      itemBuilder: (context, index) {
        final step = steps[index];
        return TimelineTile(
          isFirst: index == 0,
          isLast: index == steps.length - 1,
          beforeLineStyle:
              LineStyle(color: step.isCompleted ? Colors.black : Colors.grey),
          afterLineStyle:
              LineStyle(color: step.isCompleted ? Colors.black : Colors.grey),
          indicatorStyle: IndicatorStyle(
            color: step.isCompleted ? Colors.black : Colors.grey,
            indicator: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: step.isCompleted ? Colors.black : Colors.grey,
                ),
                child: Image.asset(icons[index])),
          ),
          endChild: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                Text(
                  step.orderState,
                  style: Styles.textStyle12(context).copyWith(
                    color: step.isCompleted
                        ? Theme.of(context).textTheme.bodyLarge!.color
                        : Colors.grey,
                  ),
                ),
                const SizedBox(height: 4),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
