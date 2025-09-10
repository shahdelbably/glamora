import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_powered_ai/Features/profile/presentation/manger/orders_cubit/orders_cubit.dart';
import 'package:store_powered_ai/Features/profile/presentation/views/widgets/active_order.dart';
import 'package:store_powered_ai/Features/profile/presentation/views/widgets/cancelled_order.dart';
import 'package:store_powered_ai/Features/profile/presentation/views/widgets/completed_order.dart';
import 'package:store_powered_ai/Features/profile/presentation/views/widgets/custom_appbar.dart';
import 'package:store_powered_ai/Features/profile/presentation/views/widgets/myorderstabs.dart';

class MyordersView extends StatefulWidget {
  const MyordersView({super.key});

  @override
  State<MyordersView> createState() => _MyordersViewState();
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _MyordersViewState extends State<MyordersView> {
  int selectedIndex = 0;

  void onTabSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const ProfileCustomAppBar(
          title: 'My Orders',
        ),
        body: BlocBuilder<OrdersCubit, OrdersState>(builder: (context, state) {
          if (state is OrdersFailure) {
            return Text(state.errorMessage);
          } else if (state is OrdersLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is OrdersLoaded) {
            // فلترة حسب status
            final activeOrders = state.orders
                .where((o) => o.status == 'pending' || o.status == 'shipped')
                .toList();
            final completedOrders =
                state.orders.where((o) => o.status == 'delivered').toList();
            final cancelledOrders =
                state.orders.where((o) => o.status == 'cancelled').toList();
            return Padding(
              padding: const EdgeInsets.only(right: 6.0, left: 6.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: MyOrdersTabs(
                      selectedIndex: selectedIndex,
                      onTabSelected: onTabSelected,
                    ),
                  ),
                  Expanded(
                    child: [
                      ActiveOrder(orders: activeOrders),
                      CompletedOrder(orders: completedOrders),
                      CancelledOrder(orders: cancelledOrders),
                    ][selectedIndex],
                  ),
                ],
              ),
            );
          } else {
            return const SizedBox();
          }
        }));
  }
}
