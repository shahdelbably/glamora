// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_powered_ai/Features/authentication/presentation/views/login_view.dart';
import 'package:store_powered_ai/Features/cart/presentation/manger/cart_cubit/cart_cubit.dart';
import 'package:store_powered_ai/Features/cart/presentation/views/widgets/cart_view_body.dart';
import 'package:store_powered_ai/Features/home/presentation/views/bottom_nav_view.dart';
import 'package:store_powered_ai/core/utils/styles.dart';
import 'package:store_powered_ai/core/utils/cache_helper.dart';
import 'package:store_powered_ai/core/widgets/empty_product.dart';

class CartView extends StatefulWidget {
  const CartView({super.key, this.onPressed});
  final void Function()? onPressed;

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    final token = CacheHelper.getData(key: 'token');
    if (token != null) {
      isLoggedIn = true;
      Future.delayed(Duration.zero, () {
        context.read<CartCubit>().getCart();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!isLoggedIn) {
      // المستخدم غير مسجل دخول
      Future.microtask(() {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please login to view your cart')),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const LoginView(
              isOnboarding: false,
              returnScreen: CartView(),
            ),
          ),
        );
      });
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: ${state.error}')),
          );
        }
      },
      builder: (context, state) {
        if (state is CartLoading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is CartLoaded) {
          final cartModel = state.cart.data;
          final isEmpty = cartModel.items.isEmpty;
          return isEmpty
              ? Scaffold(
                  appBar: AppBar(
                    title: Text('Cart', style: Styles.textStyle22(context)),
                    centerTitle: true,
                    leading: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Icons.arrow_back,
                        size: 26,
                        color: Theme.of(context).textTheme.bodyLarge?.color,
                      ),
                    ),
                  ),
                  body: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: EmptyProduct(
                      text: 'Check out what’s trending products.',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BottomNavView(),
                          ),
                        );
                      },
                    ),
                  ),
                )
              : Scaffold(
                  body: CartViewBody(
                    cartModel: cartModel,
                    onPressed: widget.onPressed ??
                        () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const BottomNavView(),
                            ),
                          );
                        },
                  ),
                );
        } else if (state is CartFailure) {
          return Center(child: Text(state.error));
        }
        return const SizedBox();
      },
    );
  }
}
