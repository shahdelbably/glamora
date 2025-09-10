import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:store_powered_ai/Features/cart/presentation/views/cart_view.dart';
import 'package:store_powered_ai/Features/payment/data/models/paybal_model/amount_model/amount_model.dart';
import 'package:store_powered_ai/Features/payment/data/models/paybal_model/item_list_model/item_list_model.dart';
import 'package:store_powered_ai/core/utils/api_keys.dart';

void exceutePaypalPayment(BuildContext context,
    ({AmountModel amount, ItemListModel itemList}) transctionsData) {
  Navigator.of(context).push(MaterialPageRoute(
    builder: (BuildContext context) => PaypalCheckoutView(
      sandboxMode: true,
      clientId: ApiKeys.clientIDPaypal,
      secretKey: ApiKeys.paypalSecretKey,
      transactions: [
        {
          "amount": transctionsData.amount.toJson(),
          "description": "The payment transaction description.",
          "item_list": transctionsData.itemList.toJson(),
        }
      ],
      note: "Contact us for any questions on your order.",
      onSuccess: (Map params) async {
        log("onSuccess: $params");
      },
      onError: (error) {
        SnackBar snackBar = SnackBar(content: Text(error.toString()));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) {
            return const CartView();
          }),
          (route) {
            return false;
          },
        );
      },
      onCancel: () {
        log('cancelled:');
        Navigator.pop(context);
      },
    ),
  ));
}
