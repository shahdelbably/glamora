import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);
  factory ServerFailure.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(
            'Connection timeout with ApiServer,please try again!');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with ApiServer,,please try again!');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(
            'Receive timeout with ApiServer,,please try again!');
      case DioExceptionType.badCertificate:
        return ServerFailure('Invalid Certificate');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiServer was cancel');
      case DioExceptionType.connectionError:
        return ServerFailure(
            'No Internet connection,please check your conncection!');
      case DioExceptionType.unknown:
        if (dioException.message!.contains('SocketException')) {
          return ServerFailure('No Internet connection');
        }
        return ServerFailure('Unexpected Error, Please try again!');
    }
  }
  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 400) {
      return ServerFailure('Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server error , Please try later!');
    } else {
      return ServerFailure('Oops There was an Error , Please try again');
    }
  }
}
