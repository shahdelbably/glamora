import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:store_powered_ai/Features/payment/data/models/stribe_model/payment_intent_input_model.dart';
import 'package:store_powered_ai/Features/payment/data/repo/payment_repo.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this.paymentRepo) : super(PaymentInitial());
  final PaymentRepo paymentRepo;
  Future makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    try {
      emit(PaymentLoading());
      await paymentRepo.makePayment(
        paymentIntentInputModel: paymentIntentInputModel,
      );
      emit(PaymentSucess());
    } on Exception catch (e) {
      emit(PaymentFailure(errMessage: e.toString()));
    }
  }

  @override
  void onChange(Change<PaymentState> change) {
    log(change.toString());
    super.onChange(change);
  }
}
