import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:store_powered_ai/Features/payment/data/models/payment_card_model.dart';
import 'package:store_powered_ai/Features/payment/data/repo/payment_repo.dart';
part 'payment_card_state.dart';

class PaymentCardCubit extends Cubit<PaymentCardState> {
  final PaymentRepo paymentRepo;
  PaymentCardCubit({required this.paymentRepo}) : super(PaymentCardInitial());

  Future<void> postPaymentCards({
    required String cardHolderName,
    required String cardNumber,
    required String expirationDate,
    required String cvv,
    required String methodName,
  }) async {
    emit(PaymentCardLoading());
    try {
      final card = await paymentRepo.postPaymentCards(
        cardHolderName: cardHolderName,
        cardNumber: cardNumber,
        expirationDate: expirationDate,
        cvv: cvv,
        methodName: methodName,
      );
      emit(PaymentCardSuccess(card)); // ✅ هنا بنبعت الموديل
    } catch (e) {
      emit(PaymentCardsFailure(e.toString()));
    }
  }

  Future<void> submitPaymentCard({
    required String cardHolderName,
    required String cardNumber,
    required String expirationDate,
    required String cvv,
    required String methodName,
  }) async {
    emit(PaymentCardLoading());

    try {
      // 1. جلب جميع الكروت
      final cards = await paymentRepo.getPaymentCards();
      log(cards.toString());

      PaymentCardModel? existingCard;

      for (var card in cards) {
        if (card.cardNumber == cardNumber) {
          existingCard = card;
          log(existingCard.toString());
          break;
        }
      }
      if (existingCard != null) {
        // 3. لو الكارت موجود بالفعل، نرجعه
        emit(PaymentCardSuccess(existingCard));
      } else {
        // 4. لو مش موجود، نعمل POST
        final newCard = await paymentRepo.postPaymentCards(
          cardHolderName: cardHolderName,
          cardNumber: cardNumber,
          expirationDate: expirationDate,
          cvv: cvv,
          methodName: methodName,
        );
        emit(PaymentCardSuccess(newCard));
      }
    } catch (e) {
      emit(PaymentCardsFailure(e.toString()));
    }
  }

  String normalizeCardNumber(String cardNumber) {
    return cardNumber.replaceAll(' ', '').trim();
  }
}
  // }
  // Future<void> submitPaymentCard({
  //   required String cardHolderName,
  //   required String cardNumber,
  //   required String expirationDate,
  //   required String cvv,
  // }) async {
  //   try {
  //     emit(PaymentCardLoading());

  //     final existingCards = await paymentRepo.getPaymentCards();

  //     final existingCard = existingCards.firstWhere(
  //       (card) => card.cardNumber == cardNumber,
  //     );

  //     if (existingCard != null) {
  //       emit(PaymentCardSuccess(existingCard));
  //     } else {
  //       await paymentRepo.postPaymentCards(
  //         cardHolderName: cardHolderName,
  //         cardNumber: cardNumber,
  //         expirationDate: expirationDate,
  //         cvv: cvv,
  //       );

  //       // لو خلص الـ post بنجاح
  //       final newCard = PaymentCardModel(
  //         id: 'new_generated_id', // في حالة الـ post الجديد
  //         cardHolderName: cardHolderName,
  //         cardNumber: cardNumber,
  //         expirationDate: expirationDate,
  //         cvv: cvv,
  //         user: 'user_id', // لو هتضيف user ID أو أي معلومات أخرى هنا
  //       );

  //       emit(PaymentCardSuccess(newCard));
  //     }
  //   } catch (e) {
  //     emit(PaymentCardsFailure(e.toString()));
  //   }
  // }
