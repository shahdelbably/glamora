import 'package:flutter/material.dart';
import 'package:store_powered_ai/core/utils/styles.dart';

class CustomTextFilterTab extends StatelessWidget {
  const CustomTextFilterTab({super.key, required this.typeTabs});
  final String typeTabs;
  @override
  Widget build(BuildContext context) {
    return Text(typeTabs, style: Styles.textStyle18(context));
  }
}
