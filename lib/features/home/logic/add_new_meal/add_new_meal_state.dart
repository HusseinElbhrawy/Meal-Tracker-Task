part of 'add_new_meal_cubit.dart';

class AddNewMealState extends Equatable {
  const AddNewMealState({
    this.addNewMealStatus = RequestStatus.initial,
    this.addNewMealErrorMessage,
    this.pickedImage,
    this.pickedTime,
  });

  ///* add new Meal
  final RequestStatus addNewMealStatus;
  final String? addNewMealErrorMessage;
  final File? pickedImage;
  final TimeOfDay? pickedTime;

  @override
  List<Object?> get props => [
        addNewMealStatus,
        addNewMealErrorMessage,
        pickedImage,
        pickedTime,
      ];

  AddNewMealState copyWith({
    RequestStatus? addNewMealStatus,
    String? addNewMealErrorMessage,
    File? pickedImage,
    TimeOfDay? pickedTime,
  }) {
    return AddNewMealState(
      addNewMealStatus: addNewMealStatus ?? this.addNewMealStatus,
      addNewMealErrorMessage:
          addNewMealErrorMessage ?? this.addNewMealErrorMessage,
      pickedImage: pickedImage ?? this.pickedImage,
      pickedTime: pickedTime ?? this.pickedTime,
    );
  }
}
