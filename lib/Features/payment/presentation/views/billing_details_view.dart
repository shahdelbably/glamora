import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_powered_ai/Features/cart/data/models/cart_model.dart';
import 'package:store_powered_ai/Features/payment/data/repo/payment_repo_impl.dart';
import 'package:store_powered_ai/Features/payment/presentation/manger/cubits/address_cubit/address_cubit.dart';
import 'package:store_powered_ai/Features/payment/presentation/views/widgets/billing_details_view_body.dart';
import 'package:store_powered_ai/core/utils/styles.dart';

class BillingDetailsView extends StatelessWidget {
  const BillingDetailsView({super.key, required this.cartModel});
  final CartModel cartModel;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddressCubit(paymentRepo: PaymentRepoImpl()),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            'Billing Details',
            style: Styles.textStyle20(context),
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
        body: BillingDetailsViewBody(
          cartModel: cartModel,
        ),
      ),
    );
  }
}
