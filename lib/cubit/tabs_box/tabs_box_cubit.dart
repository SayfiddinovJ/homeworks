import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homeworks/cubit/tabs_box/tabs_box_state.dart';

class TabsBoxCubit extends Cubit<TabsBoxState> {
  TabsBoxCubit() : super(TabsBoxState());

  updateIndex(int index) {
    emit(state.copyWith(index: index));
  }
}
