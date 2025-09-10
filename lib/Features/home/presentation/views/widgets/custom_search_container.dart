import 'package:flutter/material.dart';
import 'package:store_powered_ai/Features/search/presentation/views/camera_search_view.dart';
import 'package:store_powered_ai/Features/search/presentation/views/search_view.dart';
import 'package:store_powered_ai/core/utils/asset_data.dart';
import 'package:store_powered_ai/core/utils/styles.dart';

class CustomSearchContainer extends StatelessWidget {
  const CustomSearchContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: const Color(0xffECEEF0),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.only(
        left: 15,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const SearchView();
                  },
                ),
              );
            },
            child: Row(
              children: [
                Image.asset(AssetsData.serchIcon),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  'Search Your Needs',
                  style: Styles.textStyle13(context).copyWith(
                    fontWeight: FontWeight.w300,
                    color: Colors.black, // ✅ اللون الأسود ثابت دايمًا
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const CameraSearchView();
                  },
                ),
              );
            },
            icon: Image.asset(
              AssetsData.cameraIcon,
            ),
          ),
        ],
      ),
    );
  }
}
