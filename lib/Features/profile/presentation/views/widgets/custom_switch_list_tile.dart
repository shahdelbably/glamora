import 'package:flutter/material.dart';

class CustomSwitchListTile extends StatelessWidget {
  const CustomSwitchListTile({
    super.key,
    required this.text,
    required this.sIcon,
    required this.value,
    required this.onChanged,
  });

  final String text;
  final Icon sIcon;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      secondary: sIcon,
      activeThumbColor: Theme.of(context).textTheme.bodyLarge!.color!,
      inactiveTrackColor: Colors.transparent,
      thumbColor: WidgetStateProperty.all(
          Theme.of(context).textTheme.bodyLarge!.color!),
      trackOutlineColor: WidgetStateProperty.all(
          Theme.of(context).textTheme.bodyLarge!.color!),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      title: Text(text),
      value: value,
      onChanged: onChanged,
    );
  }
}
