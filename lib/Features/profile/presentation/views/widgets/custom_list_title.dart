import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.title,
    required this.image,
    required this.onTap
  });

  final String title;
  final String image;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
        title: Row(
          children: [
            Image.asset(image),
            const SizedBox(
              width: 6,
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            )
          ],
        ),
        trailing: Image.asset('assets/images/forward_arrow.png'));
  }
}
