import 'package:flutter/material.dart';
import 'package:store_powered_ai/Features/filter/presentation/views/filter_view.dart';
import 'package:store_powered_ai/Features/home/presentation/views/widgets/custom_search_container.dart';
import 'package:store_powered_ai/Features/search/presentation/views/widgets/custom_product_catgory_grid_view.dart';
import 'package:store_powered_ai/core/utils/asset_data.dart';

class CategoryViewBody extends StatelessWidget {
  const CategoryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8,
        left: 16,
        right: 15,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
               const Expanded(child: CustomSearchContainer()),
              const  SizedBox(
                  width: 8,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FilterView(),
                      ),
                    );
                  },
                  icon: Image.asset(
                    AssetsData.filterIcon,
                  ),
                )
              ],
            ),
          const  SizedBox(
              height: 24,
            ),
            const CustomProductCategoryGridView(

            ),
          ],
        ),
      ),
    );
  }
}
