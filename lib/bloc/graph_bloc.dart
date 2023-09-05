import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'graph_event.dart';
part 'graph_state.dart';

class GraphBloc extends Bloc<GraphEvent, GraphState> {
  GraphBloc() : super(GraphInitial()) {
    on<GraphEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
