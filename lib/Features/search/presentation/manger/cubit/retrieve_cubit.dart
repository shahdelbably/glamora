import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:store_powered_ai/Features/home/data/models/product_models.dart';
import 'package:store_powered_ai/Features/search/data/repos/retrieve_repo.dart';
part 'retrieve_state.dart';

class RetrieveCubit extends Cubit<RetrieveState> {
  RetrieveCubit(this.retrieveRepo) : super(RetrieveInitial());
  final RetrieveRepo retrieveRepo;

  Future<void> postRetrieve({required File image}) async {
    emit(RetrieveLoading());
    try {
      final products = await retrieveRepo.postRetrieve(image: image);
      emit(RetrieveSuccess(products));
    } catch (e) {
      emit(RetrieveFailure(e.toString()));
    }
  }
}
