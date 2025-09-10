import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_powered_ai/Features/authentication/data/models/user_model.dart';
import 'package:store_powered_ai/Features/authentication/data/repository/auth_repository.dart';
import 'package:store_powered_ai/core/network/dio_helper.dart';
import 'package:store_powered_ai/core/utils/cache_helper.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;

  AuthCubit(this.authRepository) : super(AuthInitial());

  // ----- Register -----
  Future<void> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    emit(AuthLoading());
    try {
      final Map<String, dynamic> userData = {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "password": password,
        "passwordConfirm": confirmPassword,
      };

      log("📤 Sending user data: $userData");

      final user = await authRepository.register(userData);

      log("✅ Registration successful: ${user.email}");

      if (user.token != null) {
        await CacheHelper.saveData(key: "token", value: user.token!);
        log("🔐 Token stored after registration: ${user.token}");
      }

      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailure(_handleError(e)));
    }
  }

  // ----- Login -----
  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());
    try {
      final loginData = {
        "email": email,
        "password": password,
      };

      final user = await authRepository.login(loginData);

      if (user.token != null) {
        await CacheHelper.saveData(key: "token", value: user.token!);
        log("🔐 Token stored after login: ${user.token}");
      }

      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailure(_handleError(e)));
    }
  }

  // ----- Update User Profile -----
  Future<void> updateUserProfile({
    required Map<String, dynamic> updatedData,
  }) async {
    emit(UpdateProfileLoading());
    try {
      final FormData formData = FormData.fromMap(updatedData);

      final updatedUser = await authRepository.updateUserProfile(formData);

      log("📝 User profile updated: ${updatedUser.email}");

      emit(UpdateProfileSuccess(updatedUser));
    } catch (e) {
      emit(UpdateProfileFailure(_handleError(e)));
    }
  }

  UserModel? userModel;

  Future<void> getMe() async {
    emit(GetMeLoading());
    try {
      final user = await authRepository.getMe();
      userModel = user;
      emit(GetMeSuccess(user));
    } catch (e) {
      emit(GetMeFailure(_handleError(e)));
    }
  }

  // ----- Helper function for clean error handling -----
  String _handleError(dynamic error) {
    if (error is Exception) {
      return error.toString().replaceFirst("Exception: ", "");
    } else {
      return "An unexpected error occurred";
    }
  }

//delete profile
  Future<void> deleteProfile() async {
    emit(DeleteProfileLoading());
    try {
      await authRepository.deleteAccount();
      emit(DeleteProfileSuccess());
    } catch (e) {
      emit(DeleteProfileFailure(e.toString()));
    }
  }

//---------change password--------
  void changePassword({
    required String currentPassword,
    required String newPassword,
    required String newPasswordConfirm,
  }) async {
    emit(ChangePasswordLoading());
    try {
      await DioHelper.patchDataWithToken(
        url: '/users/changePassword',
        data: {
          'currentPassword': currentPassword,
          'newPassword': newPassword,
          'newPasswordConfirm': newPasswordConfirm,
        },
      );

      emit(ChangePasswordSuccess());
    } catch (e) {
      emit(ChangePasswordFailure(error: e.toString()));
      log('الاكسيبششششن:$e.toString');
    }
  }
}
