import 'package:store_powered_ai/Features/payment/data/models/address_model.dart';
import 'package:store_powered_ai/Features/payment/data/models/payment_card_model.dart';
import 'package:store_powered_ai/Features/payment/data/models/stribe_model/payment_intent_input_model.dart';

abstract class PaymentRepo {
  Future<AddressModel> postAddress({
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String email,
    required String country,
    required String city,
    required String state,
    required String streetAddress,
    required String zipCode,
  });
  Future<PaymentCardModel> postPaymentCards({
    required String cardHolderName,
    required String cardNumber,
    required String expirationDate,
    required String cvv,
    required String methodName,
  });
  Future<List<AddressModel>> getAddresses();
  Future<void> patchAddress({
    required String id,
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String email,
    required String country,
    required String city,
    required String state,
    required String streetAddress,
    required String zipCode,
  });
  Future<List<PaymentCardModel>> getPaymentCards();
  Future<void> makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  });
}
