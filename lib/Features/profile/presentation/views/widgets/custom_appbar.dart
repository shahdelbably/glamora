import 'package:flutter/material.dart';

class ProfileCustomAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ProfileCustomAppBar({
    super.key,
    required this.title,
    this.color,
    this.titleColor,
    this.onPressed,
  });

  final String title;
  final Color? color;
  final Color? titleColor;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(
          color: titleColor ?? Theme.of(context).textTheme.bodyLarge?.color,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          fontFamily: 'Poppins',
        ),
      ),
      leading: IconButton(
        onPressed: onPressed ?? () => Navigator.pop(context),
        icon: Icon(
          Icons.arrow_back,
          size: 26,
          color: color ?? Theme.of(context).textTheme.bodyLarge?.color,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
