import 'dart:io';
import 'package:flutter/material.dart';
import 'package:store_powered_ai/core/utils/styles.dart';

class CustomBottomHistorySheet extends StatefulWidget {
  const CustomBottomHistorySheet({super.key, required this.imagesFileList});
  final List<File> imagesFileList;

  @override
  CustomBottomHistorySheetState createState() =>
      CustomBottomHistorySheetState();
}

class CustomBottomHistorySheetState extends State<CustomBottomHistorySheet> {
  late List<File> imagesList;

  @override
  void initState() {
    super.initState();
    imagesList = List.from(
        widget.imagesFileList); // نسخ القائمة لتحديثها بدون التأثير على الأصل
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 15, top: 24),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.75,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title & Close Button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'History',
                    style: Styles.textStyle24(context)
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close, size: 30),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // Images Grid
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.97,
                  mainAxisSpacing: 16,
                ),
                itemCount: imagesList.length,
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      // Image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Image.file(
                          imagesList[index],
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 156,
                        ),
                      ),

                      // Delete Icon (Bigger & Without Container)
                      Positioned(
                        top: 4,
                        right: 4,
                        child: IconButton(
                          icon: const Icon(Icons.cancel,
                              color: Colors.white, size: 30),
                          onPressed: () {
                            setState(() {
                              imagesList.removeAt(index);
                            });
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
