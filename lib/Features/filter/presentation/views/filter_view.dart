import 'package:flutter/material.dart';
import 'package:store_powered_ai/Features/filter/presentation/views/widgets/filter_view_body.dart';
import 'package:store_powered_ai/core/utils/styles.dart';

class FilterView extends StatelessWidget {
  const FilterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Filter', style: Styles.textStyle22(context)),
        centerTitle: true,
      ),
      body: const FilterViewBody(),
    );
  }
}
