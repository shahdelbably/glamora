import 'package:flutter/material.dart';
import 'package:store_powered_ai/Features/home/presentation/views/bottom_nav_view.dart';
import 'package:store_powered_ai/Features/search/presentation/views/widgets/search_nav_bar_view_body.dart';
import 'package:store_powered_ai/core/utils/styles.dart';

class SearchNavBarView extends StatelessWidget {
  const SearchNavBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search',
          style: Styles.textStyle22(context),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const BottomNavView()), // يرجّع للـ HomeView
            );
          },
          icon: Icon(
            Icons.arrow_back,
            size: 26,
            color: Theme.of(context).textTheme.bodyLarge?.color,
          ),
        ),
      ),
      body: const SearchNavBarViewBody(),
    );
  }
}
