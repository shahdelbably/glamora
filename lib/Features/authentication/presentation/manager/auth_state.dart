part of 'auth_cubit.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

// ----- Login/Register States -----
class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final UserModel user;
  AuthSuccess(this.user);
}

class AuthFailure extends AuthState {
  final String errorMessage;
  AuthFailure(this.errorMessage);
}

// ----- Update Profile States -----
class UpdateProfileLoading extends AuthState {}

class UpdateProfileSuccess extends AuthState {
  final UserModel updatedUser;
  UpdateProfileSuccess(this.updatedUser);
}

class UpdateProfileFailure extends AuthState {
  final String errorMessage;
  UpdateProfileFailure(this.errorMessage);
}

// ----- Get Current User (getMe) States -----
class GetMeLoading extends AuthState {}

class GetMeSuccess extends AuthState {
  final UserModel user;
  GetMeSuccess(this.user);
}

class GetMeFailure extends AuthState {
  final String errorMessage;
  GetMeFailure(this.errorMessage);
}

class DeleteProfileLoading extends AuthState {}

class DeleteProfileSuccess extends AuthState {}

class DeleteProfileFailure extends AuthState {
  final String error;
  DeleteProfileFailure(this.error);
}

// ----------change password ----------
class ChangePasswordLoading extends AuthState {}
class ChangePasswordSuccess extends AuthState {}
class ChangePasswordFailure extends AuthState {
  final String error;
  ChangePasswordFailure({required this.error});
}