import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_powered_ai/Features/payment/presentation/manger/cubits/payment_card_cubit/payment_card_cubit.dart';
import 'package:store_powered_ai/Features/payment/presentation/views/widgets/add_card_button.dart';
import 'package:store_powered_ai/Features/payment/presentation/views/widgets/custom_card_number_text_field.dart';
import 'package:store_powered_ai/Features/payment/presentation/views/widgets/custom_choice_method.dart';
import 'package:store_powered_ai/Features/payment/presentation/views/widgets/custom_cvv_text_field.dart';
import 'package:store_powered_ai/Features/payment/presentation/views/widgets/custom_expiry_date_text_field.dart';
import 'package:store_powered_ai/Features/payment/presentation/views/widgets/custom_new_card_text_field.dart';
import 'package:store_powered_ai/core/utils/asset_data.dart';
import 'package:store_powered_ai/core/utils/styles.dart';

class CustomNewCardMethod extends StatefulWidget {
  const CustomNewCardMethod({
    super.key,
    required this.isSelected,
    required this.onTap,
    required this.isSelectcheckpoint,
    this.onPressed,
    required this.onChanged,
    required this.isLoading,
    required this.methodName,
  });
  final bool isSelected;
  final Function() onTap;
  final bool isSelectcheckpoint;
  final void Function()? onPressed;
  final void Function(bool?) onChanged;
  final bool isLoading;
  final String methodName;
  @override
  State<CustomNewCardMethod> createState() => _CustomNewCardMethodState();
}

GlobalKey<FormState> formKey = GlobalKey();
String cvv = '';
String expirationDate = '';
String cardHolderName = '';
String cardNumber = '';

class _CustomNewCardMethodState extends State<CustomNewCardMethod> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(
          left: 17,
          right: 25,
          top: 14,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: const Color(0xffD7D4D8),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CustomChoiceMethod(
                    onTap: widget.onTap, isSelected: widget.isSelected),
                const SizedBox(
                  width: 9,
                ),
                Image.asset(AssetsData.creditCardLogo),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  'Add New Credit/Debit Card',
                  style: Styles.textStyle14(context).copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 14,
            ),
            CustomNewCardTextField(
                formName: 'Card Holder Name *',
                onChanged: (value) {
                  cardHolderName = value;
                },
                hintText: 'Ex. Reem Elabd'),
            CustomCardNumberTextField(
              formName: 'Card Number *',
              onChanged: (value) {
                cardNumber = value;
              },
              hintText: '**** **** **** 7128',
            ),
            CustomExpiryDateTextField(
                formName: 'Expire Date *',
                onChanged: (value) {
                  expirationDate = value;
                },
                hintText: '**/**'),
            CustomCVVTextField(
              formName: 'CVV *',
              onChanged: (value) {
                cvv = value;
              },
              hintText: '***',
            ),
            Row(
              children: [
                Checkbox(
                    activeColor: Colors.black,
                    value: widget.isSelectcheckpoint,
                    onChanged: widget.onChanged),
                const SizedBox(
                  width: 6,
                ),
                Text(
                  'Save Card For Future Payment',
                  style: Styles.textStyle12(context),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            AddCardButton(
              onPressed: widget.isLoading
                  ? null
                  : () {
                      if (widget.methodName != "") {
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<PaymentCardCubit>(context)
                              .submitPaymentCard(
                            cardHolderName: cardHolderName,
                            cardNumber: cardNumber,
                            expirationDate: expirationDate,
                            cvv: cvv,
                            methodName: widget.methodName,
                          );
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content:
                                  Text('Please ,Choose a payment method!')),
                        );
                      }
                    },
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
