import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:store_powered_ai/Features/authentication/data/models/user_model.dart';
import 'package:store_powered_ai/core/network/dio_helper.dart';
import 'package:store_powered_ai/core/network/api_endpoints.dart';
import 'package:store_powered_ai/core/utils/cache_helper.dart';

class AuthRepository {
  // register
  Future<UserModel> register(Map<String, dynamic> userData) async {
    try {
      Response response =
          await DioHelper.postData(url: ApiEndpoints.register, data: userData);
      final token = response.data["token"];
      if (token != null) {
        await CacheHelper.saveData(key: "token", value: token);
      }
      log('token auth repo:$token\n');
      return UserModel.fromJson(response.data, token: token);
    } on DioException catch (dioError) {
      String errorMessage = dioError.response?.data["message"] ??
          "Registration failed. Please try again.";
      throw Exception(errorMessage);
    } catch (error) {
      throw Exception("Unexpected error occurred: $error");
    }
  }

  // login
  Future<UserModel> login(Map<String, dynamic> loginData) async {
    try {
      Response response = await DioHelper.postData(
        url: ApiEndpoints.login,
        data: loginData,
      );

      final token = response.data["token"];
      if (token != null) {
        await CacheHelper.saveData(key: "token", value: token);
      }

      return UserModel.fromJson(
        response.data["data"]["userWithoutSensitiveData"],
        token: token,
      );
    } on DioException catch (dioError) {
      String errorMessage = dioError.response?.data["message"] ??
          "Login failed. Please check your credentials.";
      throw Exception(errorMessage);
    } catch (error) {
      throw Exception("Unexpected error occurred: $error");
    }
  }

  // update user profile
  Future<UserModel> updateUserProfile(FormData formData) async {
    try {
      Response response = await DioHelper.patchFormData(
        url: ApiEndpoints.updateProfile,
        formData: formData,
      );

      final token = CacheHelper.getData(key: "token");

      return UserModel.fromJson(
        response.data,
        token: token,
      );
    } on DioException catch (dioError) {
      String errorMessage = dioError.response?.data["message"] ??
          "Failed to update profile. Please try again.";
      throw Exception(errorMessage);
    } catch (error) {
      throw Exception("Unexpected error occurred: $error");
    }
  }

  Future<UserModel> getMe() async {
    final response = await DioHelper.getProfile();
    return UserModel.fromJson(response.data);
  }

  Future<void> deleteAccount() async {
    await DioHelper.deleteProfile();
  }

  // change password
  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    try {
      Response response = await DioHelper.patchDataWithToken(
        url: ApiEndpoints.changePassword,
        data: {
          'currentPassword': currentPassword,
          'newPassword': newPassword,
          'newPasswordConfirm': confirmPassword
        },
      );

      if (response.statusCode == 200) {
        log("Password changed successfully");
      } else {
        throw Exception("Failed to change password");
      }
    } on DioException catch (dioError) {
      String errorMessage = dioError.response?.data["message"] ??
          "Failed to change password. Please try again.";
      log('errrrrrrrrrrror is :$errorMessage');
      throw Exception(errorMessage);
    } catch (error) {
      throw Exception("Unexpected error occurred: $error");
    }
  }
}
