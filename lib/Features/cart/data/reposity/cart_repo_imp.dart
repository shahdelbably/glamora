import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:store_powered_ai/core/error/failure.dart';
import 'package:store_powered_ai/Features/cart/data/models/cart_model.dart';
import 'package:store_powered_ai/Features/cart/data/reposity/cart_repo.dart';
import 'package:store_powered_ai/core/network/api_endpoints.dart';
import 'package:store_powered_ai/core/network/dio_helper.dart';
import 'package:store_powered_ai/core/utils/cache_helper.dart';

class CartRepoImp implements CartRepo {
  Future<Either<Failure, void>> addToCart({
    required String id,
    required String quantity,
    required String size,
    required String color,
  }) async {
    try {
      final Map<String, dynamic> data = {
        "id": id,
        "quantity": quantity,
        "size": size,
        "color": color,
      };
      await DioHelper.postCart(data: data);
      return const Right(null); // مفيش return data
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, GetCartResponse>> getCart() async {
    try {
      final token = CacheHelper.getData(key: 'token');
      DioHelper.dio.options.headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      };
      Response response = await DioHelper.getData(url: ApiEndpoints.cart);
      return Right(GetCartResponse.fromJson(response.data));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteFromCart(
      {required String productId}) async {
    try {
      await DioHelper.deleteFromCart(productId: productId);
      return const Right(null);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> changeCartItemQuantity({
    required String productId,
    required String changeType,
  }) async {
    try {
      await DioHelper.patchCartItemQuantity(
        data: {'productId': productId, 'change': changeType},
        productIdd: productId,
      );
      return const Right(null);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}

// import 'package:dio/dio.dart';
// import 'package:store_powered_ai/Features/cart/data/models/cart_model.dart';
// import 'package:store_powered_ai/Features/cart/data/reposity/cart_repo.dart';
// import 'package:store_powered_ai/core/network/api_endpoints.dart';
// import 'package:store_powered_ai/core/network/dio_helper.dart';
// import 'package:store_powered_ai/core/utils/cache_helper.dart';

// class CartRepoImp implements CartRepo {
//   Future<void> addToCart({
//     required String id,
//     required String quantity,
//     required String size,
//     required String color,
//   }) async {
//     try {
//       final Map<String, dynamic> data = {
//         "id": id,
//         "quantity": quantity,
//         "size": size,
//         "color": color,
//       };

//       await DioHelper.postCart(data: data);
//       print("Add to Cart Response: $data");
//     } on DioException catch (e) {
//       final errorMsg = e.response?.data["message"] ?? "Add to cart failed.";
//       throw Exception(errorMsg);
//     }
//   }

//   Future<GetCartResponse> getCart() async {
//     try {
//       final token = CacheHelper.getData(key: 'token');
//       DioHelper.dio.options.headers = {
//         'Authorization': 'Bearer $token',
//         'Content-Type': 'application/json',
//       };
//       Response response = await DioHelper.getData(url: ApiEndpoints.cart);
//       print('📥 GetCart response: ${response.data}');

//       return GetCartResponse.fromJson(response.data);
//     } on DioException catch (e) {
//       final errorMsg =
//           e.response?.data["message"] ?? "Error fetching cart data";
//       throw Exception(errorMsg);
//     } catch (e) {
//       throw Exception("Unexpected error: $e");
//     }
//   }

//   @override
//   Future<void> deleteFromCart({required String productId}) async {
//     try {
//       await DioHelper.deleteFromCart(productId: productId);

//       print("delete from Cart Response: $productId");
//     } on DioException catch (e) {
//       final errorMsg =
//           e.response?.data["message"] ?? "Delete from cart failed.";
//       throw Exception(errorMsg);
//     }
//   }

//   @override
//   Future<void> changeCartItemQuantity({
//     required String productId,
//     required String changeType,
//   }) async {
//     try {
//       await DioHelper.patchCartItemQuantity(
//         data: {
//           'productId': productId,
//           'change': changeType,
//         },
//         productIdd: productId,
//       );
//     } on DioException catch (e) {
//       final errorMsg =
//           e.response?.data["message"] ?? "$changeType product failed.";
//       throw Exception(errorMsg);
//     }
//   }
// }
