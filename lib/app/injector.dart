import 'package:get_it/get_it.dart';
import 'package:meal_tracker/features/onboarding/logic/on_barding_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

final serviceLocator = GetIt.instance;

Future<void> initDI() async {
  //! Bloc
  await _setUpBloc();
  //! Repo
  await _setUpRepository();
  //! DataSource
  await _setUpDatasource();
  //! Core Utils
  await _setUpCoreUtils();
  //!External
  await _setUpExternal();
}

Future<void> _setUpBloc() async {
  if (!serviceLocator.isRegistered<OnBardingService>()) {
    serviceLocator.registerFactory<OnBardingService>(
      () => OnBardingService(serviceLocator()),
    );
  }
}

Future<void> _setUpRepository() async {
  // if (!serviceLocator.isRegistered<HomeRepository>()) {
  //   serviceLocator.registerLazySingleton<HomeRepository>(
  //     () => HomeRepository(
  //       serviceLocator(),
  //       serviceLocator(),
  //     ),
  //   );
  // }
}

Future<void> _setUpDatasource() async {
  // if (!serviceLocator.isRegistered<HomeRemoteDataSource>()) {
  //   serviceLocator.registerLazySingleton<HomeRemoteDataSource>(
  //     () => HomeRemoteDataSource(
  //       serviceLocator(),
  //     ),
  //   );
  // }
  // if (!serviceLocator.isRegistered<HomeLocalDataSource>()) {
  //   serviceLocator.registerLazySingleton<HomeLocalDataSource>(
  //     () => HomeLocalDataSource(
  //       serviceLocator(),
  //     ),
  //   );
  // }
}

Future<void> _setUpCoreUtils() async {
  // if (!serviceLocator.isRegistered<ApiConsumer>()) {
  //   serviceLocator.registerLazySingleton<ApiConsumer>(
  //       () => DioConsumer(dio: serviceLocator()));
  // }
}

Future<void> _setUpExternal() async {
  final sharedPref = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton(() => sharedPref);
}
