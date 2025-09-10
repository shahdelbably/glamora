import 'package:flutter/material.dart';
import 'package:store_powered_ai/Features/home/data/models/product_models.dart';

import 'package:store_powered_ai/Features/virtualtry_on/presentation/views/widgets/uploading_image.dart';

class AddItemsInTryOn extends StatelessWidget {
  const AddItemsInTryOn(
      {super.key,
      required this.imagePath,
      required this.itemImage,
      required this.clothingType,
      required this.relatedProducts});
  final String imagePath;
  final String itemImage;
  final String clothingType;
  final List<RelatedProductModel> relatedProducts;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: UploadingImageToAi(
      imagePath: imagePath, // from mobile
      itemImage: itemImage,
      clothingType: clothingType, //product item
      relatedProducts: relatedProducts,
    ));
  }
}
