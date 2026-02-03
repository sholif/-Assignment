import 'package:assignment/data/datasource/remote/dio/dio_client.dart';
import 'package:assignment/data/datasource/remote/exception/api_error_handler.dart';
import 'package:assignment/data/model/base_model/api_response.dart';
import 'package:assignment/data/repositories/local/sharepreferences_class.dart';
import 'package:assignment/utills/app_constants.dart';
import 'package:dio/dio.dart';
class HomeRepo {

  DioClient dioClient;
  final SharedPreferencesClass sharedPreferencesClass;

  HomeRepo({required this.dioClient, required this.sharedPreferencesClass});


  /// for post in
  Future<ApiResponse> allPostData() async {
    try {
      Response response = await dioClient.get(
         AppConstants.allPostUrl,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getErrorResponse(error: e));
    }
  }
  /// for user in
  Future<ApiResponse> allUserData() async {
    try {
      Response response = await dioClient.get(
       AppConstants.allUserUrl,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getErrorResponse(error: e));
    }
  }



}