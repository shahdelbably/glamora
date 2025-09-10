import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_powered_ai/Features/cart/data/models/cart_model.dart';
import 'package:store_powered_ai/Features/payment/data/models/paybal_model/amount_model/amount_model.dart';
import 'package:store_powered_ai/Features/payment/data/models/paybal_model/amount_model/details.dart';
import 'package:store_powered_ai/Features/payment/data/models/paybal_model/item_list_model/item_list_model.dart';
import 'package:store_powered_ai/Features/payment/data/models/paybal_model/item_list_model/order_item_model.dart';
import 'package:store_powered_ai/Features/payment/presentation/manger/cubits/payment_card_cubit/payment_card_cubit.dart';
import 'package:store_powered_ai/Features/payment/presentation/manger/cubits/payment_cubit/payment_cubit.dart';
import 'package:store_powered_ai/Features/payment/presentation/views/payment_complete_view.dart';
import 'package:store_powered_ai/Features/payment/presentation/views/widgets/custom_new_card_method.dart';
import 'package:store_powered_ai/Features/payment/presentation/views/widgets/custom_payment_method_container.dart';
import 'package:store_powered_ai/Features/profile/presentation/manger/orders_cubit/orders_cubit.dart';
import 'package:store_powered_ai/core/utils/asset_data.dart';
import 'package:store_powered_ai/core/utils/functions/exceute_paypal_payment.dart';
import 'package:store_powered_ai/core/utils/functions/excute_stripe_payment.dart';
import 'package:store_powered_ai/core/widgets/custom_button.dart';

class PaymentMethodViewBody extends StatefulWidget {
  const PaymentMethodViewBody(
      {super.key,
      required this.addressId,
      required this.cartModel,
      required this.currency});
  final String addressId;
  final CartModel cartModel;
  final String currency;
  @override
  State<PaymentMethodViewBody> createState() => _PaymentMethodViewBodyState();
}

class _PaymentMethodViewBodyState extends State<PaymentMethodViewBody> {
  int? selectedIndex = 0;
  bool isChecked = false;
  void _onItemSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
    if (selectedIndex == 0) {
      methodName = "paypal";
    } else if (selectedIndex == 1) {
      methodName = 'visa';
    } else if (selectedIndex == 3) {
      methodName = 'mastercard';
    }
  }

  late String paymentId;
  String methodName = 'paypal';
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCardCubit, PaymentCardState>(
      listener: (context, state) {
        if (state is PaymentCardSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Sucess, Add Card!')),
          );
          paymentId = state.card.id;
        } else if (state is PaymentCardsFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed, Try Again: ${state.error}')),
          );
        }
      },
      builder: (context, state) {
        final isLoading = state is PaymentCardLoading;

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              right: 15,
              left: 16,
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 12,
                ),
                CustomPaymentMethodContainer(
                  isSelected: selectedIndex == 0,
                  onTap: () => _onItemSelected(0),
                  image: AssetsData.paypaLogo,
                  methodName: 'PayPal',
                ),
                CustomPaymentMethodContainer(
                  isSelected: selectedIndex == 1,
                  onTap: () => _onItemSelected(1),
                  image: AssetsData.visaLogo,
                  methodName: '**** **** **** 7128',
                ),
                CustomPaymentMethodContainer(
                  isSelected: selectedIndex == 2,
                  onTap: () => _onItemSelected(2),
                  image: AssetsData.cashlogo,
                  methodName: 'Cash On Delivary',
                ),
                CustomNewCardMethod(
                  isLoading: isLoading,
                  isSelected: selectedIndex == 3,
                  onTap: () => _onItemSelected(3),
                  isSelectcheckpoint: isChecked,
                  onChanged: (bool? newValue) {
                    setState(() {
                      isChecked = newValue ?? false; // تحديث الحالة عند الضغط
                    });
                  },
                  methodName: methodName,
                ),
                const SizedBox(
                  height: 32,
                ),
                BlocConsumer<PaymentCubit, PaymentState>(
                  listener: (context, state) {
                    if (state is PaymentSucess) {
                      if (selectedIndex == 0 ||
                          selectedIndex == 1 ||
                          selectedIndex == 3) {
                        BlocProvider.of<OrdersCubit>(context).postOrder(
                          addressId: widget.addressId,
                          paymentId: paymentId,
                          cartId: widget.cartModel.id,
                        );
                      }
                    } else if (state is PaymentFailure) {
                      Navigator.of(context).pop();
                      SnackBar snackBar =
                          SnackBar(content: Text(state.errMessage));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  builder: (context, state) {
                    return BlocConsumer<OrdersCubit, OrdersState>(
                      listener: (context, state) {
                        if (state is OrdersSuccess) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return PaymentCompleteView(
                              orderModel: state.orders,
                            );
                          }));
                        } else if (state is OrdersFailure) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text(
                                    'Failed, Try Again: ${state.errorMessage}')),
                          );
                        }
                      },
                      builder: (context, state) {
                        final isLoading = state is OrdersLoading;
                        return CustomButton(
                          text: 'Continue to Payment',
                          onPressed: isLoading
                              ? null
                              : () {
                                  if (selectedIndex == 1) {
                                    exceutePaypalPayment(
                                        context, getTransctionsData());
                                  } else if (selectedIndex == 2) {
                                    BlocProvider.of<OrdersCubit>(context)
                                        .postOrder(
                                      addressId: widget.addressId,
                                      paymentId: "",
                                      cartId: widget.cartModel.id,
                                    );
                                  } else {
                                    excuteStripePayment(
                                        context, widget.cartModel.totalPrice);
                                  }
                                },
                        );
                      },
                    );
                  },
                ),
                const SizedBox(
                  height: 24,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  ({AmountModel amount, ItemListModel itemList}) getTransctionsData() {
    var amount = AmountModel(
      total: "100",
      currency: widget.currency,
      details: Details(
        shipping: "0",
        shippingDiscount: 0,
        subtotal: widget.cartModel.totalPrice.toString(),
      ),
    );

    List<OrderItemModel> orders = widget.cartModel.items.map((cartItem) {
      return OrderItemModel(
        currency: widget.currency,
        name: cartItem.productName,
        price: cartItem.price.toString(),
        quantity: cartItem.quantity,
      );
    }).toList();

    var itemList = ItemListModel(orders: orders);

    return (amount: amount, itemList: itemList);
  }
}
