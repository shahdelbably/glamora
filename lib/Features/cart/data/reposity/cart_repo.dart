import 'package:dartz/dartz.dart';
import 'package:store_powered_ai/core/error/failure.dart';
import 'package:store_powered_ai/Features/cart/data/models/cart_model.dart';

abstract class CartRepo {
  Future<Either<Failure, GetCartResponse>> getCart();

  Future<Either<Failure, void>> deleteFromCart({required String productId});

  Future<Either<Failure, void>> changeCartItemQuantity({
    required String productId,
    required String changeType, // "increase" or "decrease"
  });
}
