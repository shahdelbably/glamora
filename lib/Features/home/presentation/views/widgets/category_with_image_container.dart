import 'package:flutter/material.dart';
import 'package:store_powered_ai/Features/home/data/models/category_with_image_model.dart';
import 'package:store_powered_ai/core/utils/styles.dart';

class CategoryWithImageContainer extends StatelessWidget {
  const CategoryWithImageContainer({
    super.key,
    required this.isActive,
    required this.categoryWithImageModel,
  });
  final CategoryWithImageModel categoryWithImageModel;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: isActive ? Colors.black : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isActive ? Colors.black : const Color(0xffD9D9D9),
          )),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            categoryWithImageModel.categoryName,
            style: Styles.textStyle12(context).copyWith(
              color: isActive ? Colors.white : Colors.black,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          CircleAvatar(
            radius: 10,
            backgroundImage: AssetImage(categoryWithImageModel.image),
            backgroundColor: Colors.white,
          )
        ],
      ),
    );
  }
}
