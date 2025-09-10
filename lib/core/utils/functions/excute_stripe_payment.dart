import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_powered_ai/Features/payment/data/models/stribe_model/payment_intent_input_model.dart';
import 'package:store_powered_ai/Features/payment/presentation/manger/cubits/payment_cubit/payment_cubit.dart';

void excuteStripePayment(BuildContext context, int amount) {
  PaymentIntentInputModel paymentIntentInputModel = PaymentIntentInputModel(
    amount: amount,
    currency: 'USD',
    customerId: 'cus_Onu3Wcrzhehlez',
  );
  BlocProvider.of<PaymentCubit>(context)
      .makePayment(paymentIntentInputModel: paymentIntentInputModel);
}
