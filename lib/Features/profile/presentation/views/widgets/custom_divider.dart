// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Colors.grey.withOpacity(.5),
      indent: 15,
      endIndent: 15,
    );
  }
}
