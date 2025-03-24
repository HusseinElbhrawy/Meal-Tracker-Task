part of 'add_new_meal_cubit.dart';

class AddNewMealState extends Equatable {
  const AddNewMealState({
    this.addNewMealStatus = RequestStatus.initial,
    this.addNewMealErrorMessage,
    this.pickedImage,
  });

  ///* add new Meal
  final RequestStatus addNewMealStatus;
  final String? addNewMealErrorMessage;
  final File? pickedImage;

  @override
  List<Object?> get props =>
      [addNewMealStatus, addNewMealErrorMessage, pickedImage];

  AddNewMealState copyWith({
    RequestStatus? addNewMealStatus,
    String? addNewMealErrorMessage,
    File? pickedImage,
  }) {
    return AddNewMealState(
      addNewMealStatus: addNewMealStatus ?? this.addNewMealStatus,
      addNewMealErrorMessage:
          addNewMealErrorMessage ?? this.addNewMealErrorMessage,
      pickedImage: pickedImage ?? this.pickedImage,
    );
  }
}
