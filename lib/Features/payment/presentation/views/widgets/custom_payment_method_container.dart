import 'package:flutter/material.dart';
import 'package:store_powered_ai/Features/payment/presentation/views/widgets/custom_choice_method.dart';
import 'package:store_powered_ai/core/utils/styles.dart';

class CustomPaymentMethodContainer extends StatelessWidget {
  const CustomPaymentMethodContainer({
    super.key,
    required this.isSelected,
    required this.onTap,
    required this.image,
    required this.methodName,
  });
  final bool isSelected;
  final Function() onTap;
  final String image;
  final String methodName;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(
            left: 13,
            bottom: 12,
            top: 12,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: const Color(0xffD7D4D8),
            ),
          ),
          child: Row(
            children: [
              CustomChoiceMethod(onTap: onTap, isSelected: isSelected),
              const SizedBox(
                width: 8,
              ),
              Image.asset(image),
              const SizedBox(
                width: 8,
              ),
              Text(
                methodName,
                style: Styles.textStyle15(context)
                    .copyWith(fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 12,
        ),
      ],
    );
  }
}
