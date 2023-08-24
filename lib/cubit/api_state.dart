import 'package:equatable/equatable.dart';

abstract class ApiState extends Equatable {}

class ApiInitial extends ApiState {
  @override
  List<Object?> get props => [];
}

class ApiLoadingState extends ApiState {
  @override
  List<Object?> get props => [];
}

class ApiErrorState extends ApiState {
  final String error;

  ApiErrorState({required this.error});

  @override
  List<Object?> get props => [error];
}

class ApiSuccessState extends ApiState {
  @override
  List<Object?> get props => [];
}