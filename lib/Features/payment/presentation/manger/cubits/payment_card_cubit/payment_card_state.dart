part of 'payment_card_cubit.dart';

abstract class PaymentCardState {}

class PaymentCardInitial extends PaymentCardState {}

class PaymentCardLoading extends PaymentCardState {}

class PaymentCardSuccess extends PaymentCardState {
  final PaymentCardModel card;
  PaymentCardSuccess(this.card);
}

class PaymentCardsFailure extends PaymentCardState {
  final String error;
  PaymentCardsFailure(this.error);
}
