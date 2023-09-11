import 'package:homeworks/data/graphql/api_service.dart';

abstract class ShipsState {}

class ShipsLoadingState extends ShipsState {}

class ShipsLoadingSuccess extends ShipsState {
  ShipsLoadingSuccess(this.ships);

  final List<ShipsModel> ships;
}

class ShipsLoadingFailure extends ShipsState {}