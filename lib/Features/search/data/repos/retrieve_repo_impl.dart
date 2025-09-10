import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:store_powered_ai/Features/home/data/models/product_models.dart';
import 'package:store_powered_ai/Features/search/data/repos/retrieve_repo.dart';
import 'package:store_powered_ai/core/network/dio_helper.dart';

class RetrieveRepoImpl implements RetrieveRepo {
  @override
  Future<List<ProductModel>> postRetrieve({required File image}) async {
    try {
      FormData formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(
          image.path,
          filename: image.path.split('/').last,
        ),
      });

      final response = await DioHelper.postRetrieve(
        data: formData,
        isFormData: true,
      );

      log('📥 AI Response: ${response.data}');

      final List dataList = response.data;
      log('هههههههههههههههههههههه$dataList');
      return dataList.map((item) => ProductModel.fromJson(item)).toList();
    } on DioException catch (e) {
      final errorMsg =
          e.response?.data["message"] ?? "Failed to analyze image.";
      throw Exception(errorMsg);
    }
  }
}
  // Future<List<ProductModel>> postRetrieve({required File image}) async {
  //   try {
  //     FormData formData = FormData.fromMap({
  //       'file': await MultipartFile.fromFile(
  //         image.path,
  //         filename: image.path.split('/').last,
  //       ),
  //     });

  //     final response = await DioHelper.postRetrieve(
  //       data: formData,
  //       isFormData: true,
  //     );

  //     print('📥 AI Response: ${response.data}');

  //     final List dataList = response.data as List;

  //     return dataList
  //         .map<ProductModel>(
  //             (item) => ProductModel.fromJson(item as Map<String, dynamic>))
  //         .toList();
  //   } on DioException catch (e) {
  //     final errorMsg =
  //         e.response?.data["message"] ?? "Failed to analyze image.";
  //     print("🧨 Error: ${e.toString()}");
  //     throw Exception(errorMsg);
  //   }
  // }

