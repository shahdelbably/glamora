import 'package:flutter/material.dart';
import 'package:store_powered_ai/Features/home/presentation/views/widgets/custom_search_container.dart';
import 'package:store_powered_ai/Features/search/data/models/category_image_model.dart';
import 'package:store_powered_ai/Features/search/presentation/views/widgets/custom_category_container.dart';
import 'package:store_powered_ai/Features/search/presentation/views/widgets/custom_filter_gender_button.dart';
import 'package:store_powered_ai/core/utils/asset_data.dart';
import 'package:store_powered_ai/core/utils/styles.dart';

class SearchNavBarViewBody extends StatefulWidget {
  const SearchNavBarViewBody({super.key});

  @override
  State<SearchNavBarViewBody> createState() => _SearchNavBarViewBodyState();
}

List<CategoryImageModel> categoryGeneralAndWomenList = [
  CategoryImageModel(
      image: AssetsData.tShirts,
      categoryName: 'Tshirts',
      alignment: const Alignment(0, -0.1)),
  CategoryImageModel(
      image: AssetsData.jackets,
      categoryName: 'Jackets',
      alignment: const Alignment(0, 0)),
  CategoryImageModel(
      image: AssetsData.blouses,
      categoryName: 'Tops',
      alignment: const Alignment(0, -0.8)),
  // CategoryImageModel(
  //     image: AssetsData.coats,
  //     categoryName: 'coat',
  //     alignment: Alignment(0, 0)),
  // CategoryImageModel(
  //     image: AssetsData.shorts,
  //     categoryName: 'short',
  //     alignment: Alignment(0.7, 0.54)),
  CategoryImageModel(
      image: AssetsData.dresses,
      categoryName: 'Dresses',
      alignment: const Alignment(0, -1)),
  // CategoryImageModel(
  //     image: AssetsData.hoodies,
  //     categoryName: 'hoodie',
  //     alignment: Alignment(0, -1)),
  CategoryImageModel(
      image: AssetsData.pants,
      categoryName: 'Jeans',
      alignment: const Alignment(0, -0.3)),
  CategoryImageModel(
      image: AssetsData.pullover,
      categoryName: 'Sweatshirts',
      alignment: const Alignment(0, 1.05)),
  CategoryImageModel(
      image: AssetsData.pullover,
      categoryName: 'Sweaters',
      alignment: const Alignment(0, 0.13)),
  CategoryImageModel(
      image: AssetsData.sale,
      categoryName: 'SALE %',
      alignment: const Alignment(0, 0)),
];

List<CategoryImageModel> categoryMenList = [
  CategoryImageModel(
      image: AssetsData.tShirts,
      categoryName: 'Tshirts',
      alignment: const Alignment(0, -0.1)),
  CategoryImageModel(
      image: AssetsData.jackets,
      categoryName: 'Jackets',
      alignment: const Alignment(0, 0)),
  // CategoryImageModel(
  //     image: AssetsData.coats,
  //     categoryName: 'coat',
  //     alignment: Alignment(0, 0)),
  // CategoryImageModel(
  //     image: AssetsData.shorts,
  //     categoryName: 'pants',
  //     alignment: Alignment(0.7, 0.54)),
  CategoryImageModel(
      image: AssetsData.hoodies,
      categoryName: 'Tops',
      alignment: const Alignment(0, -1)),
  CategoryImageModel(
      image: AssetsData.pants,
      categoryName: 'Jeans',
      alignment: const Alignment(0, -0.3)),
  CategoryImageModel(
      image: AssetsData.pullover,
      categoryName: 'Sweaters',
      alignment: const Alignment(0, 0.13)),
  CategoryImageModel(
      image: AssetsData.pullover,
      categoryName: 'Sweatshirts',
      alignment: const Alignment(0, 1.05)),
  CategoryImageModel(
      image: AssetsData.sale,
      categoryName: 'SALE %',
      alignment: const Alignment(0, 0)),
];

class _SearchNavBarViewBodyState extends State<SearchNavBarViewBody> {
  String selectedCategory = 'Men';

  @override
  Widget build(BuildContext context) {
    List<CategoryImageModel> categories = selectedCategory == "Men"
        ? categoryMenList
        : categoryGeneralAndWomenList;

    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 15),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomSearchContainer(),
            const SizedBox(height: 24),
            Row(
              children: [
                CustomFilterGenderButton(
                  isSelected: selectedCategory == "Men",
                  text: 'Men',
                  onPressed: () {
                    setState(() {
                      selectedCategory = "Men"; // تحديث الفئة إلى Men
                    });
                  },
                ),
                const SizedBox(width: 12),
                CustomFilterGenderButton(
                  isSelected: selectedCategory == "Women",
                  text: 'Women',
                  onPressed: () {
                    setState(() {
                      selectedCategory = "Women"; // تحديث الفئة إلى Women
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 24),
            Text('Categories', style: Styles.textStyle16(context)),
            const SizedBox(height: 16),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                String title;
                String subCategory = category.categoryName;
                if (selectedCategory == "Men") {
                  title = "male-${category.categoryName}";
                } else if (selectedCategory == "Women") {
                  title = "female-${category.categoryName}";
                } else {
                  title = category.categoryName.toLowerCase();
                }

                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: CustomCategoryContainer(
                    subCategory,
                    categoryImageModel: category,
                    title: title,
                    gender: selectedCategory == 'Men' ? "male" : "female",
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
