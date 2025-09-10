// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:store_powered_ai/Features/search/data/models/category_image_model.dart';
import 'package:store_powered_ai/Features/search/presentation/views/category_view.dart';
import 'package:store_powered_ai/core/utils/styles.dart' show Styles;

class CustomCategoryContainer extends StatelessWidget {
  final CategoryImageModel categoryImageModel;
  final String title;
  final String gender;
  final String? subCategory;
  const CustomCategoryContainer(
    this.subCategory, {
    super.key,
    required this.categoryImageModel,
    required this.title,
    required this.gender,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return CategoryView(
            subCategory: subCategory,
            title: title,
            gender: gender,
          );
        }));
      },
      child: Container(
        height: 80,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          image: DecorationImage(
            image: AssetImage(categoryImageModel.image),
            fit: BoxFit.cover,
            alignment: categoryImageModel.alignment,
          ),
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 28,
            color: const Color.fromARGB(224, 236, 235, 218).withOpacity(0.37),
            child: Center(
              child: Text(
                categoryImageModel.categoryName,
                style: Styles.textStyle14(context)
                    .copyWith(fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
