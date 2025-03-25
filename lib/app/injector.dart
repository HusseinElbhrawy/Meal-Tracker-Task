import 'package:get_it/get_it.dart';
import 'package:meal_tracker/features/home/data/datasources/home_local_data_source.dart';
import 'package:meal_tracker/features/home/data/repositories/home_repository.dart';
import 'package:meal_tracker/features/home/logic/add_new_meal/add_new_meal_cubit.dart';
import 'package:meal_tracker/features/home/logic/edit_meal/edit_meal_cubit.dart';
import 'package:meal_tracker/features/home/logic/home/home_cubit.dart';
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
  if (!serviceLocator.isRegistered<AddNewMealCubit>()) {
    serviceLocator.registerFactory<AddNewMealCubit>(
      () => AddNewMealCubit(serviceLocator()),
    );
  }
  if (!serviceLocator.isRegistered<EditMealCubit>()) {
    serviceLocator.registerFactory<EditMealCubit>(
      () => EditMealCubit(serviceLocator()),
    );
  }
  if (!serviceLocator.isRegistered<HomeCubit>()) {
    serviceLocator.registerLazySingleton<HomeCubit>(
      () => HomeCubit(serviceLocator()),
    );
  }
}

Future<void> _setUpRepository() async {
  if (!serviceLocator.isRegistered<HomeRepository>()) {
    serviceLocator.registerLazySingleton<HomeRepository>(
      () => HomeRepository(
        serviceLocator(),
      ),
    );
  }
}

Future<void> _setUpDatasource() async {
  if (!serviceLocator.isRegistered<HomeLocalDataSource>()) {
    serviceLocator.registerLazySingleton<HomeLocalDataSource>(
      () => HomeLocalDataSource(),
    );
  }
}

Future<void> _setUpCoreUtils() async {}

Future<void> _setUpExternal() async {
  final sharedPref = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton(() => sharedPref);
}
