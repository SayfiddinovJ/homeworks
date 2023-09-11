
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homeworks/bloc/graph_event.dart';
import 'package:homeworks/bloc/graph_state.dart';
import 'package:homeworks/data/graphql/api_client.dart';

class ShipsBloc extends Bloc<ShipsEvent, ShipsState> {
  ShipsBloc({required ShipsApiClient jobsApiClient})
      : _jobsApiClient = jobsApiClient,
        super(ShipsLoadingState()) {
    on<ShipsFetchStarted>(_onCountriesFetchStarted);
  }

  final ShipsApiClient _jobsApiClient;

  Future<void> _onCountriesFetchStarted(
      ShipsFetchStarted event,
      Emitter<ShipsState> emit,
      ) async {
    emit(ShipsLoadingState());
    try {
      final countries = await _jobsApiClient.getCountries();
      emit(ShipsLoadingSuccess(countries));
    } catch (error) {
      debugPrint("ERROR:$error");
      emit(ShipsLoadingFailure());
    }
  }
}