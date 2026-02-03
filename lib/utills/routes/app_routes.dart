
import 'package:assignment/features/home/view/screen/home_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';


class AppRoutes {
  static int duration = 300;

  static final appRoutes = [


    defaultTransitionPage(name:HomeScreen.routeName, page: () => HomeScreen()),


    // dynamicArgumentPage(
    //   name: VerificationScreen.routeName,
    //   pageBuilder: (args) => VerificationScreen(email: args['email'], otp: args['otp'],),
    // ),


    //dynamicArgumentPage(name: DailyQuotesScreen.routeName, pageBuilder: (args) => DailyQuotesScreen(quotesId: args),),


  ];
}






//
GetPage defaultTransitionPage({
  required String name,
  required GetPageBuilder page,
}) {
  return GetPage(
    name: name,
    page: page,
    transition: Transition.noTransition,
    transitionDuration: Duration(milliseconds: AppRoutes.duration),
  );
}

// for argument pass route
GetPage dynamicArgumentPage({
  required String name,
  required Widget Function(dynamic args) pageBuilder,
}) {
  return GetPage(
    name: name,
    page: () => pageBuilder(Get.arguments),
    transition: Transition.noTransition,
    transitionDuration: Duration(milliseconds: AppRoutes.duration),
  );
}
