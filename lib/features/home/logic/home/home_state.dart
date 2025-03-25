part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({
    this.getAllMealsStatus = RequestStatus.initial,
    this.getAllMealsErrorMessage,
    this.meals = const [],
    this.removeMealErrorMessage,
    this.removeMealStatus = RequestStatus.initial,
  });

  ///* Get All Meals
  final RequestStatus getAllMealsStatus;
  final String? getAllMealsErrorMessage;
  final List<MealModel> meals;

  ///* Remove Meal
  final RequestStatus removeMealStatus;
  final String? removeMealErrorMessage;

  @override
  List<Object?> get props {
    return [
      getAllMealsStatus,
      getAllMealsErrorMessage,
      meals,
      removeMealErrorMessage,
      removeMealStatus,
    ];
  }

  HomeState copyWith({
    RequestStatus? getAllMealsStatus,
    String? getAllMealsErrorMessage,
    List<MealModel>? meals,
    RequestStatus? removeMealStatus,
    String? removeMealErrorMessage,
  }) {
    return HomeState(
      getAllMealsStatus: getAllMealsStatus ?? this.getAllMealsStatus,
      getAllMealsErrorMessage:
          getAllMealsErrorMessage ?? this.getAllMealsErrorMessage,
      meals: meals ?? this.meals,
      removeMealStatus: removeMealStatus ?? this.removeMealStatus,
      removeMealErrorMessage:
          removeMealErrorMessage ?? this.removeMealErrorMessage,
    );
  }
}
