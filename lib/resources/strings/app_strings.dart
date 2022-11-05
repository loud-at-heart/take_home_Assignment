class AppStrings {
  AppStrings._();

  static const String serverDownTitle = 'Server is down';
  static const String serverDownSub =
      'We ran into an unexpected error. We’re trying to resolve it. Please retry after sometime.';
  static const String serverDownButtonText = 'Retry';
  static const String noInternetTitle = 'No internet';
  static const String noInternetSub =
      'Slow or no internet. Please check your network and try again.';
  static const String noInternetButtonText = 'Try again';
  static const String errorSub =
      'We ran into an unexpected error. We’re trying to resolve it. Please retry after sometime.';
  static const String somethingWentWrongText = 'Something went wrong';
  static const String permissionDeniedDialogTitle = 'Permission required';
  static const String permissionDeniedDialogSubtitle =
      'Read location permission is required to use this feature. You can grant it in app Settings.';
  static const String permissionDeniedDialogGoToSettings = 'Go to settings';

  //images
  static const String _svgPath = 'assets/svg_icons/';
  static const String serverNotWorking = _svgPath + 'serverNotWorking.svg';
  static const String lostConnection = _svgPath + 'lostConnection.svg';
  static const String somethingWentWrong = _svgPath + 'somethingWentWrong.svg';
}
