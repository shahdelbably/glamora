import 'package:bloc/bloc.dart';
import 'package:store_powered_ai/Features/cart/data/models/cart_model.dart';
import 'package:store_powered_ai/Features/cart/data/reposity/cart_repo_imp.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepoImp cartRepository;
  CartCubit(this.cartRepository) : super(CartInitial());

  void addToCart({
    required String id,
    required String quantity,
    required String size,
    required String color,
  }) async {
    emit(CartLoading());
    final result = await cartRepository.addToCart(
      id: id,
      quantity: quantity,
      size: size,
      color: color,
    );

    result.fold(
      (failure) => emit(CartFailure(failure.errMessage)),
      (_) => emit(CartSuccess()),
    );
  }

  void getCart() async {
    emit(CartLoading());
    final result = await cartRepository.getCart();

    result.fold(
      (failure) => emit(CartFailure(failure.errMessage)),
      (cartData) => emit(CartLoaded(cartData)),
    );
  }

  void changeItemQuantity({
    required String productId,
    required String changeType,
    void Function()? onFailure,
  }) async {
    emit(CartLoading());
    final changeResult = await cartRepository.changeCartItemQuantity(
      productId: productId,
      changeType: changeType,
    );

    changeResult.fold(
      (failure) {
        emit(CartFailure(failure.errMessage));
        if (onFailure != null) onFailure();
      },
      (_) async {
        final cartResult = await cartRepository.getCart();
        cartResult.fold(
          (failure) => emit(CartFailure(failure.errMessage)),
          (cartData) => emit(CartLoaded(cartData)),
        );
      },
    );
  }

  void deleteFromCart({required String productId}) async {
    emit(CartLoading());
    final deleteResult = await cartRepository.deleteFromCart(
      productId: productId,
    );

    deleteResult.fold(
      (failure) => emit(CartFailure(failure.errMessage)),
      (_) async {
        final cartResult = await cartRepository.getCart();
        cartResult.fold(
          (failure) => emit(CartFailure(failure.errMessage)),
          (cartData) => emit(CartLoaded(cartData)),
        );
      },
    );
  }
}
