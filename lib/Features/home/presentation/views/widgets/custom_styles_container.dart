// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:store_powered_ai/Features/search/presentation/views/category_view.dart';
import 'package:store_powered_ai/core/utils/asset_data.dart';
import 'package:store_powered_ai/core/utils/styles.dart';

class CustomStylesContainer extends StatelessWidget {
  const CustomStylesContainer({super.key, this.filters});

  final dynamic filters;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomStylesImageContainer(
              category: 'male',
              textStyle: 'Men Styles',
              image: AssetsData.menStyles,
            ),
            SizedBox(width: 8),
            CustomStylesImageContainer(
              category: 'male',
              textStyle: 'New Collection',
              image: AssetsData.newCollection,
            ),
          ],
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return CategoryView(
                title: 'female',
                gender: 'female',
                colors: filters != null ? filters['colors'] : null,
                sizes: filters != null ? filters['sizes'] : null,
                brands: filters != null ? filters['brands'] : null,
                priceRange: filters != null ? filters['priceRange'] : null,
              );
            }));
          },
          child: Container(
            height: 132,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                image: AssetImage(AssetsData.enchantingStylesWomen),
                fit: BoxFit.cover,
                alignment: Alignment(0, -0.5),
              ),
            ),
            child: Center(
              child: Container(
                height: 32,
                color: Colors.white.withOpacity(0.54),
                child: Center(
                  child: Text(
                    'Enchanting Styles for Every Women',
                    style: Styles.textStyle14(context).copyWith(
                        fontWeight: FontWeight.w500, color: Colors.black),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomStylesImageContainer extends StatelessWidget {
  const CustomStylesImageContainer({
    super.key,
    required this.textStyle,
    required this.image,
    required this.category,
  });

  final String textStyle;
  final String image;
  final String category;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return CategoryView(
                title: textStyle,
                gender: category,
              );
            }),
          );
        },
        child: Container(
          height: 116,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
              alignment: const Alignment(0, 0.5),
            ),
          ),
          child: Center(
            child: Container(
              height: 24,
              color: Colors.white.withOpacity(0.54),
              child: Center(
                child: Text(
                  textStyle,
                  style: Styles.textStyle12(context).copyWith(
                      fontWeight: FontWeight.w500, color: Colors.black),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
