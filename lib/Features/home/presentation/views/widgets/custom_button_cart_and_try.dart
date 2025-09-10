import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_powered_ai/Features/authentication/presentation/views/login_view.dart';
import 'package:store_powered_ai/Features/cart/presentation/manger/cart_cubit/cart_cubit.dart';
import 'package:store_powered_ai/Features/home/data/models/product_models.dart';
import 'package:store_powered_ai/Features/virtualtry_on/presentation/views/try_on.dart';
import 'package:store_powered_ai/core/utils/styles.dart';
import 'package:store_powered_ai/core/utils/cache_helper.dart'; // مهم

class CustomButtonCartAndTry extends StatelessWidget {
  const CustomButtonCartAndTry({
    super.key,
    required this.product,
    required this.selectedColor,
    required this.selectedSize,
  });

  final ProductModel product;
  final String selectedColor;
  final String selectedSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 15,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BlocConsumer<CartCubit, CartState>(
            listener: (context, state) {
              if (state is CartSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Success: Added to Cart')),
                );
              } else if (state is CartFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Failed, Try Again: ${state.error}')),
                );
              }
            },
            builder: (context, state) {
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 79,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: state is CartLoading
                    ? null
                    : () {
                        final token = CacheHelper.getData(key: 'token');
                        if (token == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Please login to add to cart')),
                          );
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginView(isOnboarding: false,)));
                        } else {
                          BlocProvider.of<CartCubit>(context).addToCart(
                            id: product.id,
                            quantity: '1',
                            size: selectedSize,
                            color: selectedColor,
                          );
                        }
                      },
                child: Text(
                  'Add to cart',
                  style: Styles.textStyle14(context).copyWith(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              );
            },
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              padding: const EdgeInsets.symmetric(
                vertical: 4,
                horizontal: 10,
              ),
              side: const BorderSide(color: Colors.black),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {
              final token = CacheHelper.getData(key: 'token');
              if (token == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('Please login to try AI feature')),
                );
                Navigator.pushNamed(context, '/login');
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TryOn(
                      itemImage: product.img,
                      clothingType: product.clothingType,
                      relatedProducts:product.relatedItems,
                    ),
                  ),
                );
              }
            },
            child: Text(
              'Try AI',
              style: Styles.textStyle13(context).copyWith(
                  color: Theme.of(context).textTheme.bodyLarge?.color),
            ),
          ),
        ],
      ),
    );
  }
}
