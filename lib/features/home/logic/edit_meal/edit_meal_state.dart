part of 'edit_meal_cubit.dart';

class EditMealState extends Equatable {
  const EditMealState({
    this.editMealStatus = RequestStatus.initial,
    this.editMealErrorMessage,
    this.pickedImage,
    this.item,
  });

  ///* Edit  Meal
  final RequestStatus editMealStatus;
  final String? editMealErrorMessage;
  final File? pickedImage;
  final MealModel? item;

  @override
  List<Object?> get props => [
        editMealStatus,
        editMealErrorMessage,
        pickedImage,
        item,
      ];

  EditMealState copyWith({
    RequestStatus? editMealStatus,
    String? editMealErrorMessage,
    File? pickedImage,
    MealModel? item,
  }) {
    return EditMealState(
      editMealStatus: editMealStatus ?? this.editMealStatus,
      editMealErrorMessage: editMealErrorMessage ?? this.editMealErrorMessage,
      pickedImage: pickedImage ?? this.pickedImage,
      item: item ?? this.item,
    );
  }
}
