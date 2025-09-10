import 'package:bloc/bloc.dart';
import 'package:store_powered_ai/Features/payment/data/models/address_model.dart';
import 'package:store_powered_ai/Features/payment/data/repo/payment_repo.dart';
part 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  final PaymentRepo paymentRepo;
  AddressCubit({required this.paymentRepo}) : super(AddressInitial());

  Future<void> submitAddress({
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String email,
    required String country,
    required String city,
    required String state,
    required String streetAddress,
    required String zipCode,
  }) async {
    emit(AddressLoading());

    try {
      // 1. جلب جميع العناوين
      final addresses = await paymentRepo.getAddresses();

      // 2. البحث عن العنوان باستخدام الـ email داخل الـ list
      AddressModel? existingAddress;
      for (var address in addresses) {
        if (address.email == email) {
          existingAddress = address;
          break; // لو لقيت العنوان، خلاص بوقف البحث
        }
      }

      if (existingAddress != null) {
        // 3. لو موجود، نعمل تحديث باستخدام PATCH
        await paymentRepo.patchAddress(
          id: existingAddress.id,
          firstName: firstName,
          lastName: lastName,
          phoneNumber: phoneNumber,
          email: email,
          country: country,
          city: city,
          state: state,
          streetAddress: streetAddress,
          zipCode: zipCode,
        );
        emit(AddressSuccess(existingAddress)); // إرجاع الـ AddressModel المعدل
      } else {
        // 4. لو مش موجود، نعمل إضافة جديدة باستخدام POST
        final newAddress = await paymentRepo.postAddress(
          firstName: firstName,
          lastName: lastName,
          phoneNumber: phoneNumber,
          email: email,
          country: country,
          city: city,
          state: state,
          streetAddress: streetAddress,
          zipCode: zipCode,
        );
        emit(AddressSuccess(newAddress)); // إرجاع الـ AddressModel الجديد
      }
    } catch (e) {
      emit(AddressFailure(e.toString()));
    }
  }
}
