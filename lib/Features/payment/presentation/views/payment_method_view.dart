import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_powered_ai/Features/cart/data/models/cart_model.dart';
import 'package:store_powered_ai/Features/payment/data/repo/payment_repo_impl.dart';
import 'package:store_powered_ai/Features/payment/presentation/manger/cubits/payment_card_cubit/payment_card_cubit.dart';
import 'package:store_powered_ai/Features/payment/presentation/manger/cubits/payment_cubit/payment_cubit.dart';
import 'package:store_powered_ai/Features/payment/presentation/views/widgets/payment_method_view_body.dart';
import 'package:store_powered_ai/core/utils/styles.dart';

class PaymentMethodView extends StatelessWidget {
  const PaymentMethodView(
      {super.key,
      required this.addressId,
      required this.currency,
      required this.cartModel});
  final String addressId;
  final String currency;
  final CartModel cartModel;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PaymentCardCubit(
            paymentRepo: PaymentRepoImpl(),
          ),
        ),
        BlocProvider(
          create: (context) => PaymentCubit(
            PaymentRepoImpl(),
          ),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            'Payment Method',
            style: Styles.textStyle16(context).copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back,
              size: 26,
              color: Theme.of(context).textTheme.bodyLarge?.color,
            ),
          ),
        ),
        body: PaymentMethodViewBody(
          addressId: addressId,
          currency: currency,
          cartModel: cartModel,
        ),
      ),
    );
  }
}
