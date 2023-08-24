class TabsBoxState {
  int index;

  TabsBoxState({this.index = 0});

  TabsBoxState copyWith({int? index}) =>
      TabsBoxState(index: index ?? this.index);

  @override
  String toString() {
    return "Index:$index";
  }
}
