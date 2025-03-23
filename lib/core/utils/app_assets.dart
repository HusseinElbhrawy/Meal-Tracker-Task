const String _imagePath = 'assets/images';
const String _lottiePath = 'assets/lottie';
const String _svgPath = 'assets/svg';

class AppImageAssets {
  const AppImageAssets._();
  static const AppImageAssets _instance = AppImageAssets._();
  factory AppImageAssets() => _instance;

  static const String logo = '$_imagePath/logo.png';
}

class AppSvgAssets {
  const AppSvgAssets._();
  static const AppSvgAssets _instance = AppSvgAssets._();
  factory AppSvgAssets() => _instance;

  static const String onboarding1 = '$_svgPath/onboarding_1.svg';
  static const String onboarding2 = '$_svgPath/onboarding_2.svg';
  static const String onboarding3 = '$_svgPath/onboarding_3.svg';
}

class AppLottieAssets {
  AppLottieAssets._internal();
  static final AppLottieAssets _instance = AppLottieAssets._internal();
  factory AppLottieAssets() => _instance;

  static const String loading = '$_lottiePath/loading.json';
  static const String error = '$_lottiePath/error.json';
  static const String empty = '$_lottiePath/empty.json';
}
