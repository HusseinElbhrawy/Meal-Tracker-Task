part of 'edit_meal_cubit.dart';

class EditMealState extends Equatable {
  const EditMealState({
    this.editMealStatus = RequestStatus.initial,
    this.editMealErrorMessage,
    this.pickedImage,
    this.item,
    this.pickedTime,
  });

  ///* Edit  Meal
  final RequestStatus editMealStatus;
  final String? editMealErrorMessage;
  final File? pickedImage;
  final MealModel? item;
  final TimeOfDay? pickedTime;

  @override
  List<Object?> get props => [
        editMealStatus,
        editMealErrorMessage,
        pickedImage,
        item,
        pickedTime,
      ];

  EditMealState copyWith({
    RequestStatus? editMealStatus,
    String? editMealErrorMessage,
    File? pickedImage,
    MealModel? item,
    TimeOfDay? pickedTime,
  }) {
    return EditMealState(
      editMealStatus: editMealStatus ?? this.editMealStatus,
      editMealErrorMessage: editMealErrorMessage ?? this.editMealErrorMessage,
      pickedImage: pickedImage ?? this.pickedImage,
      item: item ?? this.item,
      pickedTime: pickedTime ?? this.pickedTime,
    );
  }
}
