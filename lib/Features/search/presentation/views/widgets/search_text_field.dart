import 'package:flutter/material.dart';
import 'package:store_powered_ai/Features/search/presentation/views/camera_search_view.dart';
import 'package:store_powered_ai/core/utils/asset_data.dart';
import 'package:store_powered_ai/core/utils/styles.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key, required this.onSubmitted});
  final void Function(String) onSubmitted;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextField(
        onSubmitted: onSubmitted,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          hintText: 'Search Your Needs',
          hintStyle: Styles.textStyle13(context).copyWith(
            fontWeight: FontWeight.w300,
          ),
          prefixIcon: IconButton(
            onPressed: () {},
            icon: Image.asset(
              AssetsData.serchIcon,
            ),
          ),
          suffixIcon: IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const CameraSearchView();
              }));
            },
            icon: Image.asset(
              AssetsData.cameraIcon,
            ),
          ),
          contentPadding: const EdgeInsets.only(
            top: 12,
            right: 15,
            bottom: 12,
            left: 12,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: const Color(0xffECEEF0),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            borderSide: BorderSide(
              color: Color(0xffECEEF0),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
