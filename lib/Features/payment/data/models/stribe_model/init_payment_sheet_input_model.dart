class InitPaymentSheetInputModel {
  final String paymentIntentClientSecret;
  final String ephemeralKeySecret;
  final String customerId;

  InitPaymentSheetInputModel({
    required this.paymentIntentClientSecret,
    required this.ephemeralKeySecret,
    required this.customerId,
  });
}
