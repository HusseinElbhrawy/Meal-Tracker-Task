import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String message;

  const Failure({required this.message});

  @override
  List<Object?> get props => [message];
}

class DatabaseFailure extends Failure {
  const DatabaseFailure({required super.message});
  @override
  List<Object?> get props => [message];
}

class NoInternetFailure extends Failure {
  const NoInternetFailure() : super(message: 'No Internet Connection');
}

class LocalStorageFailure extends Failure {
  const LocalStorageFailure({required super.message});
  @override
  List<Object?> get props => [message];
}
