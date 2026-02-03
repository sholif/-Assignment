

import 'dart:async';
import 'dart:developer';
import 'package:get/get.dart';

import '../../data/repositories/local/sharepreferences_class.dart';
import '../../utills/app_constants.dart';



class SplashController extends GetxController{



  Future<bool> checkToken() async{
    String? token = await SharedPreferencesClass.getValue(AppConstants.accessToken);
    log('check token auth ======> $token');
    return token ==null ? false : true;
  }

  startTimer(){
    Timer(const Duration(seconds: 2),()async{
      if(await checkToken() == true){
        //Get.offAllNamed(LandingScreen.routeName);
      } else{
        //Get.offAllNamed(SignUpScreen.routeName);
      }
      
    });
  }

  @override
  void onInit() {
    startTimer();
    super.onInit();
  }
  
  
  
}