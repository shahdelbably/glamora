import 'package:flutter/material.dart';
import 'package:store_powered_ai/Features/home/presentation/views/favorite_view.dart';
import 'package:store_powered_ai/core/utils/styles.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Glamora',
          style: Styles.textStyle24(context),
        ),
        Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const FavoriteView();
                      },
                    ),
                  );
                },
                icon: Icon(
                  Icons.favorite,
                  color: Theme.of(context)
                      .iconTheme
                      .color, // هياخد اللون من الـ theme مباشرة
                )),
          ],
        ),
      ],
    );
  }
}
