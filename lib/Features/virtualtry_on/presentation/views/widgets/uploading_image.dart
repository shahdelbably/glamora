import 'package:flutter/material.dart';
import 'package:store_powered_ai/Features/home/data/models/product_models.dart';
import 'package:store_powered_ai/Features/profile/presentation/views/widgets/custom_appbar.dart';
import 'package:store_powered_ai/Features/virtualtry_on/presentation/views/widgets/image_before_tring.dart';
import 'package:store_powered_ai/Features/virtualtry_on/presentation/views/widgets/uploadedimagewithrecommendation.dart';

class UploadingImageToAi extends StatefulWidget {
  const UploadingImageToAi(
      {super.key,
      required this.imagePath,
      required this.clothingType,
      required this.itemImage,
      required this.relatedProducts});

  final String imagePath; // from mobile
  final String itemImage; //product item
  final String clothingType;
  final List<RelatedProductModel> relatedProducts;

  @override
  UploadingImageToAiState createState() => UploadingImageToAiState();
}

class UploadingImageToAiState extends State<UploadingImageToAi> {
  bool onTap = false;

  void _handleIconTap(bool value) {
    setState(() {
      onTap = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/ai-background.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          children: [
            const ProfileCustomAppBar(title: 'Try The Product'),
            Expanded(
              child: onTap
                  ? Uploadedimagewithrecommendation(
                      imagePath: widget.imagePath,
                      itemImage: widget.itemImage,
                      clothingType: widget.clothingType,
                      relatedProducts: widget.relatedProducts,
                    )
                  : ImageBeforeTring(
                      imagePath: widget.imagePath,
                      onIconTap: _handleIconTap,
                    ),
            ),
          ],
        ),
      ],
    );
  }
}
