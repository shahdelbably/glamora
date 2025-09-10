// import 'package:dio/dio.dart';

// class TryOnRepository {
//   final Dio dio;

//   TryOnRepository(this.dio);

//  Future<String> uploadTryOnImage({
//   required String userImagePath,
//   required String productImageUrl,
//   required String clothingType,
// }) async {
//   final formData = FormData();

//   formData.files.add(MapEntry(
//     "person_image",
//     await MultipartFile.fromFile(userImagePath, filename: "person_image.png"),
//   ));

//   formData.fields.addAll([
//     MapEntry("cloth_url", productImageUrl),
//     MapEntry("cloth_type", clothingType),
//     MapEntry("num_inference_steps", "5"), // ✅ تم إضافتها هنا
//   ]);

//   try {
//     final response = await dio.post(
//       "https://seriously-moved-husky.ngrok-free.app/try-on",
//       data: formData,
//       options: Options(headers: {
//         "Content-Type": "multipart/form-data",
//       }),
//     );

//     print("Response status: ${response.statusCode}");
//     print("Response data: ${response.data}");

//     if (response.statusCode == 200 && response.data["success"] == true) {
//       return response.data["image_url"];
//     } else {
//       throw Exception("Upload failed: ${response.data}");
//     }
//   } on DioException catch (e) {
//     print("Dio Error: ${e.response?.data ?? e.message}");
//     throw Exception("Dio Error: ${e.response?.data ?? e.message}");
//   } catch (e) {
//     print("Unexpected Error: $e");
//     throw Exception("Unexpected Error: $e");
//   }
// }

// }
import 'dart:developer';

import 'package:dio/dio.dart';

class TryOnRepository {
  final Dio dio;

  TryOnRepository(this.dio);

  Future<String> uploadTryOnImage({
    required String userImagePath,
    required String productImageUrl,
    required String clothingType,
  }) async {
    final formData = FormData.fromMap({
      "person_image": await MultipartFile.fromFile(
        userImagePath,
        filename: "person_image.png",
      ),
      "cloth_url": productImageUrl,
      "cloth_type": clothingType,
      "num_inference_steps": 30, // تم إرسالها كـ int مش String
    });

    try {
      final response = await dio.post(
        "https://seriously-moved-husky.ngrok-free.app/try-on",
        data: formData,
        options: Options(headers: {
          "Content-Type": "multipart/form-data",
        }),
      );

      log("Response status: ${response.statusCode}");
      log("Response data: ${response.data}");

      if (response.statusCode == 200 && response.data["success"] == true) {
        return response.data["image_url"];
      } else {
        throw Exception("Upload failed: ${response.data}");
      }
    } on DioException catch (e) {
      log("Dio Error: ${e.response?.data ?? e.message}");
      throw Exception("Dio Error: ${e.response?.data ?? e.message}");
    } catch (e) {
      log("Unexpected Error: $e");
      throw Exception("Unexpected Error: $e");
    }
  }
}
