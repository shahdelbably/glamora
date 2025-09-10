import 'package:flutter/material.dart';
import 'package:store_powered_ai/Features/filter/presentation/manger/models/color_models.dart';
import 'package:store_powered_ai/Features/filter/presentation/manger/models/filter_model.dart';
import 'package:store_powered_ai/Features/filter/presentation/views/widgets/custom_button_filter.dart';
import 'package:store_powered_ai/Features/filter/presentation/views/widgets/custom_color_list_view.dart';
import 'package:store_powered_ai/Features/filter/presentation/views/widgets/custom_price_filter_list_view.dart';
import 'package:store_powered_ai/Features/filter/presentation/views/widgets/custom_text_filter_tab.dart';
import 'package:store_powered_ai/Features/filter/presentation/views/widgets/filter_tabs_list_view.dart';

class FilterViewBody extends StatefulWidget {
  const FilterViewBody({super.key});

  @override
  State<FilterViewBody> createState() => _FilterViewBodyState();
}

class _FilterViewBodyState extends State<FilterViewBody> {
  final ScrollController scrollController = ScrollController();

  void scrollToTop() {
    scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  int activeBrandIndex = 0;
  int activeSortedByIndex = 0;
  int activeSizeIndex = 0;
  int selectedPriceIndex = -1;
  int selectedColorIndex = -1;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomTextFilterTab(typeTabs: 'Sorted by'),
            const SizedBox(height: 8),
            FilterTabsListView(
              tabList: sortedByList,
              activeTabsIndex: activeSortedByIndex,
              onTabsTap: (index) {
                setState(() {
                  activeSortedByIndex = index;
                });
              },
            ),
            const SizedBox(height: 18),
            const CustomTextFilterTab(typeTabs: 'Brand'),
            const SizedBox(height: 8),
            FilterTabsListView(
              tabList: brandList,
              activeTabsIndex: activeBrandIndex,
              onTabsTap: (index) {
                setState(() {
                  activeBrandIndex = index;
                });
              },
            ),
            const SizedBox(height: 18),
            const CustomTextFilterTab(typeTabs: 'Size'),
            const SizedBox(height: 8),
            FilterTabsListView(
              tabList: sizeList,
              activeTabsIndex: activeSizeIndex,
              onTabsTap: (index) {
                setState(() {
                  activeSizeIndex = index;
                });
              },
            ),
            const SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomTextFilterTab(typeTabs: 'Colors'),
                IconButton(
                  onPressed: scrollToTop,
                  icon: const Icon(Icons.keyboard_arrow_up),
                ),
              ],
            ),
            CustomColorListView(
              scrollController: scrollController,
              selectedIndex: selectedColorIndex,
              onColorTap: (index) {
                setState(() {
                  selectedColorIndex == index
                      ? selectedColorIndex = -1
                      : selectedColorIndex = index;
                });
              },
              colorList: colorList,
            ),
            const SizedBox(height: 8),
            const CustomTextFilterTab(typeTabs: 'Price'),
            const SizedBox(height: 8),
            CustomPriceFilterListView(
              selectedIndex: selectedPriceIndex,
              onPriceTap: (index) {
                setState(() {
                  selectedPriceIndex == index
                      ? selectedPriceIndex = -1
                      : selectedPriceIndex = index;
                });
              },
              priceRangeList: priceRangeList,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: CustomButtonFilter(
                    text: 'Apply',
                    onPressed: () {
                      final selectedColor = selectedColorIndex != -1
                          ? colorList[selectedColorIndex]
                              .colorName
                              .toLowerCase()
                          : null;

                      final selectedSize = activeSizeIndex != 0
                          ? [sizeList[activeSizeIndex]]
                          : null;

                      final selectedBrand = activeBrandIndex != 0
                          ? brandList[activeBrandIndex]
                          : null;

                      final selectedPrice = selectedPriceIndex != -1
                          ? priceRangeList[selectedPriceIndex]
                              .replaceAll('\$', '')
                          : null;

                      final filters = ProductFilters(
                        color: selectedColor,
                        sizes: selectedSize,
                        brand: selectedBrand,
                        priceRange: selectedPrice,
                      );

                      Navigator.pop(context, filters);
                    },
                    colorButton: Colors.black,
                    colorText: Colors.white,
                    shadowColorButton: Colors.black,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: CustomButtonFilter(
                    text: 'Reset Filter',
                    onPressed: () {
                      setState(() {
                        selectedPriceIndex = -1;
                        selectedColorIndex = -1;
                        activeBrandIndex = 0;
                        activeSizeIndex = 0;
                        activeSortedByIndex = 0;
                      });
                    },
                    colorButton: Colors.transparent,
                    colorText: Theme.of(context).textTheme.bodyLarge!.color!,
                    shadowColorButton: Colors.transparent,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<String> brandList = const [
    'All',
    'H&M',
    'Zara',
    'LC',
    'Bershka',
    'Pull&Bear',
    'SHIEN',
    'Defacto',
  ];

  List<String> genderList = const [
    'All',
    'Men',
    'Women',
  ];

  List<String> sortedByList = const [
    'All',
    'Popular',
    'Newest',
    'Trendy',
  ];

  List<String> sizeList = const [
    'All',
    'XS',
    'S',
    'M',
    'L',
  ];

  List<String> priceRangeList = [
    '\$10.00 - \$99.00',
    '\$100.00 - \$199.00',
    '\$200.00 - \$299.00',
    '\$300.00 - \$399.00',
    '\$400.00 -\$499.00',
    '\$500.00+',
  ];

  List<ColorModels> colorList = [
    ColorModels(colorName: 'blue', color: const Color(0xff1877F2)),
    ColorModels(colorName: 'black', color: const Color(0xff000000)),
    ColorModels(colorName: 'red', color: const Color(0xffFF0000)),
    ColorModels(colorName: 'yellow', color: const Color(0xffFFF500)),
    ColorModels(colorName: 'Green', color: const Color(0xff3A8E50)),
    ColorModels(colorName: 'Pink', color: const Color(0xffE5088C)),
    ColorModels(colorName: 'Orange', color: const Color(0xffFD614D)),
  ];
}
