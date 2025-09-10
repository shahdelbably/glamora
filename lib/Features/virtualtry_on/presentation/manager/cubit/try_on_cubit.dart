import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_powered_ai/Features/virtualtry_on/data/repo/try_on_repo_imp.dart';
import 'package:store_powered_ai/Features/virtualtry_on/presentation/manager/cubit/try_onstate.dart';

class TryOnCubit extends Cubit<TryOnState> {
  final TryOnRepository repository;

  TryOnCubit(this.repository) : super(TryOnInitial());

  Future<void> uploadImage({
    required String userImagePath,
    required String productImageUrl,
    required String clothingType,
  }) async {
    log("Starting upload...");
    emit(TryOnLoading());

    try {
      final imageUrl = await repository.uploadTryOnImage(
          userImagePath: userImagePath,
          productImageUrl: productImageUrl,
          clothingType: clothingType);
      log("Upload successful! Image URL: $imageUrl");
      emit(TryOnSuccess(imageUrl));
    } catch (e) {
      log("Upload failed: $e");
      emit(TryOnFailure(e.toString()));
    }
  }
}
