import 'package:dartz/dartz.dart';
import 'package:meal_tracker/core/errors/failure.dart';

typedef DefaultResponse<T> = Future<Either<Failure, T>>;
