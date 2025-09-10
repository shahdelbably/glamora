import 'package:flutter/material.dart';
import 'package:store_powered_ai/core/utils/styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.pageName});
  final String pageName;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            size: 26,
            color: Theme.of(context).textTheme.bodyLarge?.color,
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              pageName,
              style: Styles.textStyle16(context).copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
