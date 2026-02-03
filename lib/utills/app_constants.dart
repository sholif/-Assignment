class AppConstants {

  /// Core API Url
  static const String baseUrl = "https://dashboard.willowwellness.net/api/v1";
  static const String baseUrl2 = "https://dashboard.willowwellness.net/api";
  static const String imageUrl = "https://dashboard.willowwellness.net";


  /// App Name
  static const String appName = 'Willow';


  ///auth
  static const String registration = '$baseUrl/sign-up';
  static const String verifyOtp = '$baseUrl/verify/otp';
  static const String login = '$baseUrl/login';
  static const String forgetPassword = "$baseUrl/forgot-password/send-otp";
  static const String forgetPasswordVerifyOtp = "$baseUrl/forgot-password/verify-otp";
  static const String resetPassword = '$baseUrl/forgot-password';
  static const String logOut = '$baseUrl/auth/logout';
  static const String continueWithGuest = '$baseUrl/continue-with-guest';
  static const String deleteAccount = '$baseUrl/auth/account-delete';


  /// Digital Detox
  static const String digitalDetox= '$baseUrl/digital-detox';


  /// Profile
  static const String userProfile = '$baseUrl/auth/profile';
  static const String updateProfile = '$baseUrl/auth/profile';
  static const String favourite = '$baseUrl/favorites';

  /// Quotes
  static const String dailyQuotes = '$baseUrl/daily-quotes';
  static const String dailyQuotesDetails = '$baseUrl/daily-quotes';
  static const String toggleFav = '$baseUrl/favorites/toggle';


  /// journal
  static const String listOfJournalType = '$baseUrl/categories';
  static const String journals = '$baseUrl/Journals';
  static const String journalDetails = '$baseUrl/Journals';

  /// Goals
  static const String addGoals = '$baseUrl/goals/add-new';
  static const String goalsList = '$baseUrl/goals';
  static const String deleteGoals = '$baseUrl/goals/delete';
  static const String goalDetails = '$baseUrl/goals/details';
  static const String markTodayCompleteUrl = '$baseUrl/goals';
  static const String updateGoal = '$baseUrl/goals/update';

  /// Meditation
  static const String meditation = '$baseUrl/meditations';
  static const String meditationDetails = '$baseUrl/meditations';


  /// Notification
  static const String notificationUpdateUrl = '$baseUrl/auth/profile-notification';



  /// check subscription
  static const String checkSubscription = '$baseUrl2/check-subscribed';

  /// Share-preference
  static const String accessToken = 'accessToken';
  static const String userRole = 'userRole';

}
