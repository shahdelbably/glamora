import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:store_powered_ai/Features/payment/data/models/address_model.dart';
import 'package:store_powered_ai/Features/payment/data/models/payment_card_model.dart';
import 'package:store_powered_ai/Features/payment/data/models/stribe_model/payment_intent_input_model.dart';
import 'package:store_powered_ai/core/network/dio_helper.dart';
import 'package:store_powered_ai/core/utils/services/stripe_services.dart';
import 'payment_repo.dart';

class PaymentRepoImpl implements PaymentRepo {
  @override
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
  }) async {
    try {
      final Map<String, dynamic> data = {
        "firstName": firstName,
        "lastName": lastName,
        "phoneNumber": phoneNumber,
        "email": email,
        "country": country,
        "city": city,
        "state": state,
        "streetAddress": streetAddress,
        "zipCode": zipCode,
      };

      final response = await DioHelper.postAddresses(data: data);
      final model = PostAddressResponse.fromJson(response.data);
      return model.address;
    } on DioException catch (e) {
      final errorMsg = e.response?.data["message"] ?? "Post address failed.";
      throw Exception(errorMsg);
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }

  @override
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
  }) async {
    try {
      final data = {
        "firstName": firstName,
        "lastName": lastName,
        "phoneNumber": phoneNumber,
        "email": email,
        "country": country,
        "city": city,
        "state": state,
        "streetAddress": streetAddress,
        "zipCode": zipCode,
      };

      // مهم: ما تبعتيش id أو user أو createdAt أو updatedAt
      await DioHelper.patchAddress(id: id, data: data);
      log("Patch Address Success");
    } on DioException catch (e) {
      final errorMsg = e.response?.data["message"] ?? "Patch address failed.";
      throw Exception(errorMsg);
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }

  @override
  Future<List<AddressModel>> getAddresses() async {
    try {
      final response =
          await DioHelper.getAddresses(); // لو عملناها بدون queryParams
      final model = GetAddressesResponse.fromJson(response.data);
      return model.addresses;
    } on DioException catch (e) {
      final errorMsg = e.response?.data["message"] ?? "Get addresses failed.";
      throw Exception(errorMsg);
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }

  @override
  Future<PaymentCardModel> postPaymentCards({
    required String cardHolderName,
    required String cardNumber,
    required String expirationDate,
    required String cvv,
    required String methodName,
  }) async {
    try {
      final Map<String, dynamic> data = {
        "cardHolderName": cardHolderName,
        "cardNumber": cardNumber,
        "expirationDate": expirationDate,
        'cvv': cvv,
        'methodName': methodName
      };

      final response = await DioHelper.postPaymentCards(data: data);
      final model = PostPaymentCardResponse.fromJson(response.data);
      return model.paymentCard;
    } on DioException catch (e) {
      final errorMsg =
          e.response?.data["message"] ?? "Post Payment card failed.";
      throw Exception(errorMsg);
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }

  // @override
  // Future<List<PaymentCardModel>> getPaymentCards() async {
  //   try {
  //     final response = await DioHelper.getPaymentCards();
  //     final model = GetPaymentCardsResponse.fromJson(response.data);
  //     return model.cards;
  //   } on DioException catch (e) {
  //     final errorMsg =
  //         e.response?.data["message"] ?? "Get payment cards failed.";
  //     throw Exception(errorMsg);
  //   } catch (e) {
  //     throw Exception("Unexpected error: $e");
  //   }
  // }
  @override
  Future<List<PaymentCardModel>> getPaymentCards() async {
    try {
      final response = await DioHelper.getPaymentCards();
      final model = GetPaymentCardsResponse.fromJson(response.data);
      return model.cards;
    } on DioException catch (e) {
      final message =
          e.response?.data["message"]?.toString().toLowerCase() ?? "";

      if (message == "no payment cards found") {
        // الحالة الوحيدة اللي نرجّع فيها list فاضية ونتجاهل الخطأ
        return [];
      }

      final errorMsg =
          message.isNotEmpty ? message : "Get payment cards failed.";
      throw Exception(errorMsg);
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }

  final StripeServices stripeServices = StripeServices();
  @override
  Future<void> makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    try {
      await stripeServices.makePayment(
        paymentIntentInputModel: paymentIntentInputModel,
      );
    } on Exception catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }
}
