import 'package:flutter/material.dart';
import 'package:store_powered_ai/core/utils/asset_data.dart';
import 'package:store_powered_ai/core/utils/styles.dart';

class CustomRecentlySearchedContainer extends StatelessWidget {
  const CustomRecentlySearchedContainer(
      {super.key,
      required this.item,
      required this.onPressedDeleted,
      required this.onTapSearch});
  final String item;
  final void Function() onPressedDeleted;
  final void Function() onTapSearch;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapSearch,
      child: SizedBox(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  Image.asset(AssetsData.recentlySearchedIcon),
                  const SizedBox(
                    width: 8,
                  ),
                  Flexible(
                    child: Text(
                      item,
                      overflow:
                          TextOverflow.ellipsis, // يجعل النص الطويل مختصر بنقط
                      maxLines: 1,
                      style: Styles.textStyle10(context).copyWith(
                        fontWeight: FontWeight.w400,
                        color: const Color(0xffA8A8B1),
                      ),
                    ),
                  )
                ],
              ),
            ),
            IconButton(
              onPressed: onPressedDeleted,
              icon: Image.asset(
                AssetsData.closeIcon,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
