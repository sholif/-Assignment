import 'package:assignment/features/home/controller/home_controller.dart';
import 'package:assignment/features/home/data/repo/home_repo.dart';
import 'package:assignment/utills/app_constants.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'data/datasource/remote/dio/dio_client.dart';
import 'data/datasource/remote/dio/logging_interceptor.dart';
import 'data/repositories/local/sharepreferences_class.dart';



final sl = GetIt.instance;

Future<void> init() async {

  /// Core
  sl.registerLazySingleton(() => DioClient(AppConstants.baseUrl, sl(), loggingInterceptor: sl(), sharedPreferences: sl()));

  /// Repository
  sl.registerLazySingleton(() => HomeRepo(dioClient: sl(), sharedPreferencesClass:sl()));



   /// For user Profile
  //sl.registerLazySingleton(() => UserProfileRepo(dioClient: sl(), sharedPreferences: sl()));





/// Controller
  /// Auth controller
  Get.lazyPut(() => HomeController(dioClient: sl(), homeRepo: sl(), sharedPreferencesClass: sl(),),fenix: true);
  // Get.lazyPut(() => OtpVerificationController(dioClient: sl(), otpVerificationRepo: sl(),),fenix: true);







/// External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => LoggingInterceptor());
  /// Register your wrapper class
  sl.registerLazySingleton(() => SharedPreferencesClass());


}