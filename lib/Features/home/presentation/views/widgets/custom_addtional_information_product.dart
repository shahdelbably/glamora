import 'package:flutter/material.dart';
import 'package:store_powered_ai/Features/home/data/models/product_models.dart';
import 'package:store_powered_ai/core/utils/styles.dart';

class CustomAddtionalInformationProduct extends StatelessWidget {
  const CustomAddtionalInformationProduct({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();

    // Initialize productDetails inside build method
    final List<Map<String, String>> productDetails = [
      {"Features": "Material", "Description": product.material},
      {"Features": "Size", "Description": product.sizes.join((", "))},
      {"Features": "Color", "Description": product.colors.join((", "))},
      {"Features": "Country of origin", "Description": product.countryOfOrigin},
      // {"Features": "Brand", "Description": product.brand ?? 'Unknown'},
      {"Features": "Care Instructions", "Description": "Unknown."},
      {"Features": "Body Length", "Description": "Unknown"},
      {"Features": "Chest Width", "Description": "Unknown"},
      {"Features": "Sleeve Length", "Description": "Unknown"},
    ];

    return Column(
      children: [
        Table(
          columnWidths: const {
            0: FlexColumnWidth(1.4),
            1: FlexColumnWidth(2),
          },
          border: TableBorder.all(color: Colors.transparent),
          children: [
            TableRow(
              decoration: const BoxDecoration(color: Colors.black),
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Features",
                      style: Styles.textStyle12(context).copyWith(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Description",
                      style: Styles.textStyle12(context).copyWith(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 175,
          child: RawScrollbar(
            radius: const Radius.circular(16),
            controller: scrollController,
            thumbVisibility: true,
            thickness: 4,
            thumbColor: Colors.black,
            child: SingleChildScrollView(
              controller: scrollController,
              child: Table(
                columnWidths: const {
                  0: FlexColumnWidth(1.4),
                  1: FlexColumnWidth(2),
                },
                border: TableBorder.all(color: Colors.transparent),
                children: [
                  ...productDetails.map((item) {
                    int index = productDetails.indexOf(item);
                    return TableRow(
                      decoration: BoxDecoration(
                        color: index % 2 == 0
                            ? (Theme.of(context).brightness == Brightness.dark
                                    ? Colors.grey[800] // اللون الداكن
                                    : Colors.grey[300] // اللون الفاتح
                                )
                            : Colors.transparent,
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Text(item["Features"]!,
                              style: Styles.textStyle10(context)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Text(item["Description"]!,
                              style: Styles.textStyle10(context)),
                        ),
                      ],
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
