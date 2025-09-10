import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:store_powered_ai/Features/payment/data/models/stribe_model/ephemeral_key_model/ephemeral_key_model.dart';
import 'package:store_powered_ai/Features/payment/data/models/stribe_model/init_payment_sheet_input_model.dart';
import 'package:store_powered_ai/Features/payment/data/models/stribe_model/payment_intent_input_model.dart';
import 'package:store_powered_ai/Features/payment/data/models/stribe_model/payment_intent_model/payment_intent_model.dart';
import 'package:store_powered_ai/core/network/dio_helper.dart';
import 'package:store_powered_ai/core/utils/api_keys.dart';

class StripeServices {
  final DioHelper dioHelper = DioHelper();
  Future<PaymentIntentModel> createPaymentIntent(
    PaymentIntentInputModel paymentIntentInputModel,
  ) async {
    var response = await dioHelper.postpayment(
      body: paymentIntentInputModel.tojson(),
      url: 'https://api.stripe.com/v1/payment_intents',
      contentType: Headers.formUrlEncodedContentType,
      token: ApiKeys.stripeSecretKeys,
    );
    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);
    return paymentIntentModel;
  }

  Future initPaymentSheet({
    required InitPaymentSheetInputModel initPaymentSheetInputModel,
  }) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret:
            initPaymentSheetInputModel.paymentIntentClientSecret,
        customerEphemeralKeySecret:
            initPaymentSheetInputModel.ephemeralKeySecret,
        customerId: initPaymentSheetInputModel.customerId,
        merchantDisplayName: 'Shahdoda elbably',
      ),
    );
  }

  Future diaplayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);
    var ephemeralKeyModel = await createEphemeralKey(
      customerId: paymentIntentInputModel.customerId,
    );

    var initPaymentSheetInputModel = InitPaymentSheetInputModel(
      paymentIntentClientSecret: paymentIntentModel.clientSecret!,
      customerId: paymentIntentInputModel.customerId,
      ephemeralKeySecret: ephemeralKeyModel.secret!,
    );
    await initPaymentSheet(
      initPaymentSheetInputModel: initPaymentSheetInputModel,
    );
    await diaplayPaymentSheet();
  }

  Future<EphemeralKeyModel> createEphemeralKey({
    required String customerId,
  }) async {
    var response = await dioHelper.postpayment(
      body: {'customer': customerId},
      url: 'https://api.stripe.com/v1/ephemeral_keys',
      contentType: Headers.formUrlEncodedContentType,
      headers: {
        'Authorization': 'Bearer ${ApiKeys.stripeSecretKeys}',
        'Stripe-Version': '2025-06-30.basil',
      },
      token: ApiKeys.stripeSecretKeys,
    );
    var ephemeralKeyModel = EphemeralKeyModel
        .fromIdEphkey1RkqYspEfg4x4FUcBteXh95LObjectEphemeralKeyAssociatedObjectsIdCusSg6A7MyzHt9vkCTypeCustomerCreated1752515564Expires1752519164LivemodeFalseSecretEkTestYwNjdF8xUmd2b3dQrwZnNHg0RlVjLgfReDriWkVVeXzjwunstXc5VGs4M0R5b1Bjt1U5dWi00MjmiBxyE(
      response.data,
    );
    return ephemeralKeyModel;
  }
}
