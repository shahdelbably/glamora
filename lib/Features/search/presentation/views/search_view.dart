import 'package:flutter/material.dart';
import 'package:store_powered_ai/Features/search/presentation/views/widgets/search_view_body.dart';
import 'package:store_powered_ai/core/utils/styles.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text('Search',
            style: Styles.textStyle16(context).copyWith(
              fontWeight: FontWeight.w600,
            )),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            size: 26,
            color: Theme.of(context).textTheme.bodyLarge?.color,
          ),
        ),
      ),
      body: const SearchViewBody(),
    );
  }
}
