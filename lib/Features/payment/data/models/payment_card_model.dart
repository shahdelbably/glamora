class PaymentCardModel {
  final String id;
  final String cardHolderName;
  final String cardNumber;
  final String expirationDate;
  final String cvv;
  final String user;
  final String methodName;

  PaymentCardModel({
    required this.id,
    required this.cardHolderName,
    required this.cardNumber,
    required this.expirationDate,
    required this.cvv,
    required this.user,
    required this.methodName,
  });

  factory PaymentCardModel.fromJson(Map<String, dynamic> json) {
    return PaymentCardModel(
      id: json['_id'],
      cardHolderName: json['cardHolderName'],
      cardNumber: json['cardNumber'] ?? '',
      expirationDate: json['expirationDate'],
      cvv: json['cvv'],
      user: json['user'],
      methodName: json['methodName'],
    );
  }
}

class PostPaymentCardResponse {
  final String status;
  final PaymentCardModel paymentCard;

  PostPaymentCardResponse({
    required this.status,
    required this.paymentCard,
  });

  factory PostPaymentCardResponse.fromJson(Map<String, dynamic> json) {
    return PostPaymentCardResponse(
      status: json['status'],
      paymentCard: PaymentCardModel.fromJson(json['data']['paymentCard']),
    );
  }
}

class GetPaymentCardsResponse {
  final List<PaymentCardModel> cards;

  GetPaymentCardsResponse({required this.cards});

  factory GetPaymentCardsResponse.fromJson(Map<String, dynamic> json) {
    final list = json['data']?['paymentCards'] as List? ?? [];

    return GetPaymentCardsResponse(
      cards: list.map((e) => PaymentCardModel.fromJson(e)).toList(),
    );
  }
}
