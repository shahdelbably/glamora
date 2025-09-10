import 'package:flutter/material.dart';
import 'package:store_powered_ai/Features/search/presentation/views/widgets/custom_recently_searched_container.dart';
import 'package:store_powered_ai/core/utils/styles.dart';

class CustomReentlySearched extends StatefulWidget {
  const CustomReentlySearched({
    super.key,
    required this.onTapSearch,
  });
  final void Function() onTapSearch;
  @override
  State<CustomReentlySearched> createState() => _CustomReentlySearchedState();
}

class _CustomReentlySearchedState extends State<CustomReentlySearched> {
  List<String> searchedRecentlyList = [
    'Coats - Woman',
    'Skirts',
    'Shein',
    'White shirt',
    'Pants',
    'blouses',
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Recently Searched',
              style: Styles.textStyle16(context),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  searchedRecentlyList.clear();
                });
              },
              child: Text(
                'Clear All',
                style: Styles.textStyle10(context).copyWith(
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.underline,
                  color: const Color(0xffFF0000),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: searchedRecentlyList.length,
          itemBuilder: (context, index) {
            return CustomRecentlySearchedContainer(
                item: searchedRecentlyList[index],
                onPressedDeleted: () {
                  setState(() {
                    searchedRecentlyList.remove(searchedRecentlyList[index]);
                  });
                },
                onTapSearch: widget.onTapSearch);
          },
        ),
      ],
    );
  }
}
