import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_powered_ai/Features/home/data/models/product_models.dart';
import 'package:store_powered_ai/Features/home/presentation/manager/home_cubit.dart';
import 'package:store_powered_ai/Features/home/presentation/manager/home_state.dart';
import 'package:store_powered_ai/Features/home/presentation/views/widgets/dots_indicator.dart';
import 'package:store_powered_ai/Features/virtualtry_on/presentation/manager/cubit/try_on_cubit.dart';
import 'package:store_powered_ai/Features/virtualtry_on/presentation/manager/cubit/try_onstate.dart';
import 'package:store_powered_ai/Features/virtualtry_on/presentation/views/widgets/bottom_sheet_details_in_ai.dart';

class Uploadedimagewithrecommendation extends StatefulWidget {
  final String imagePath; // صورة من الموبايل
  final String itemImage; // صورة المنتج
  final String clothingType;
  final List<RelatedProductModel> relatedProducts;

  const Uploadedimagewithrecommendation(
      {super.key,
      required this.imagePath,
      required this.itemImage,
      required this.clothingType,
      required this.relatedProducts});

  @override
  UploadedimagewithrecommendationState createState() =>
      UploadedimagewithrecommendationState();
}

class UploadedimagewithrecommendationState
    extends State<Uploadedimagewithrecommendation> {
  final PageController _controller = PageController();
  bool showFullImage = false;
  String? selectedItem;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        showFullImage = _controller.page == 1;
      });
    });
  }

  _handleItemTap({required clothingType, required img}) {
    final cubit = context.read<TryOnCubit>();
    cubit.uploadImage(
      userImagePath: widget.imagePath,
      productImageUrl: img,
      clothingType: clothingType,
    );
  }

  void _showBottomSheetWithImage(String imageUrl) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(53),
          topRight: Radius.circular(48),
        ),
      ),
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.85, //
          child: BotomsheetinAi(imagePath: imageUrl),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TryOnCubit, TryOnState>(
      listener: (context, state) {
        if (state is TryOnSuccess) {
          _showBottomSheetWithImage(state.imageUrl);
        } else if (state is TryOnFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text("فشل في تحميل الصورة: ${state.errorMessage}")),
          );
        }
      },
      child: Scaffold(
        body: Stack(
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
                Expanded(
                  child: PageView(
                    controller: _controller,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 150,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () => _handleItemTap(
                                        clothingType: widget.clothingType,
                                        img: widget.itemImage),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        widget.itemImage,
                                        width: 120,
                                        height: 120,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                BlocBuilder<ProductDetailsCubit, HomeState>(
                                  builder: (context, state) {
                                    if (state is RelatedProductsLoading) {
                                      return const Center(
                                          child: CircularProgressIndicator());
                                    } else if (state is RelatedProductsLoaded) {
                                      final relatedProducts =
                                          state.relatedProducts;

                                      if (relatedProducts.isEmpty) {
                                        return const Center(
                                            child:
                                                Text("لا توجد منتجات مشابهة"));
                                      }

                                      return Expanded(
                                          child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: relatedProducts.length,
                                        itemBuilder: (context, index) {
                                          final item = relatedProducts[index];
                                          return GestureDetector(
                                            onTap: () => _handleItemTap(
                                                clothingType: item.clothingType,
                                                img: item.img),
                                            child: Container(
                                              margin: const EdgeInsets.only(
                                                  bottom: 30,
                                                  left: 16,
                                                  right: 16),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                child: Image.network(
                                                  item.img,
                                                  height: 120,
                                                  width: 120,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ));
                                    } else if (state is RelatedProductsError) {
                                      return Center(child: Text(state.message));
                                    }
                                    return const SizedBox();
                                  },
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 23.0, bottom: 23),
                              child: BlocBuilder<TryOnCubit, TryOnState>(
                                builder: (context, state) {
                                  if (state is TryOnLoading) {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  } else if (state is TryOnSuccess) {
                                    return Image.network(
                                      state.imageUrl,
                                      fit: BoxFit.cover,
                                    );
                                  } else if (state is TryOnFailure) {
                                    return Center(
                                      child: Text(
                                        'Error: ${state.errorMessage}',
                                        style: const TextStyle(
                                            color: Colors.red, fontSize: 18),
                                        textAlign: TextAlign.center,
                                      ),
                                    );
                                  } else {
                                    //  عرض صورة الشخص الأصلية على اليمين
                                    return Image.file(
                                      File(widget.imagePath),
                                      fit: BoxFit.cover,
                                    );
                                  }
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      // الصفحة التانية: الصورة الأصلية فقط
                      Center(
                        child: widget.imagePath.isNotEmpty
                            ? Image.file(
                                File(widget.imagePath),
                                fit: BoxFit.contain,
                                height: MediaQuery.of(context).size.height,
                              )
                            : const Center(child: CircularProgressIndicator()),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DotsIndicator(
                    pageController: _controller,
                    count: 2,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// class BuildItemThumbleNail extends StatelessWidget {
//   final String relatedProductsimg;

//   const BuildItemThumbleNail({Key? key, required this.relatedProductsimg}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 18.0),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(10),
//         child: Image.network(
//           relatedProductsimg,
//           width: 120,
//           height: 120,
//           fit: BoxFit.cover,
//         ),
//       ),
//     );
//   }
// }
