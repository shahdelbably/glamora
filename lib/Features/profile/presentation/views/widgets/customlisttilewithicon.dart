import 'package:flutter/material.dart';

class CustomListTileWithIcons extends StatelessWidget {
  const CustomListTileWithIcons({
    super.key, required this.sIcon, required this.text, this.onTap,
  });
  final Icon sIcon ;
  final String text ;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: sIcon,
      title: Text(text),
      trailing:const Icon(Icons.arrow_forward_ios),
      onTap:onTap,
    );
  }
}
