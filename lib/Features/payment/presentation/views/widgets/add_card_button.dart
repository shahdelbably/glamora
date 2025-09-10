import 'package:flutter/material.dart';
import 'package:store_powered_ai/core/utils/styles.dart';

class AddCardButton extends StatelessWidget {
  const AddCardButton({super.key, required this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          padding: const EdgeInsets.only(
            top: 10,
            bottom: 10,
            left: 20,
            right: 20,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        child: Text(
          'Add Catd',
          style: Styles.textStyle12(context).copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ));
  }
}
