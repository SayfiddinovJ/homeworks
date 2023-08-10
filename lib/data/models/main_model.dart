import 'package:homeworks/data/models/dynamic_view_model.dart';

class MainModel {
  final List<DynamicViewModel> dynamicView;

  MainModel({
    required this.dynamicView,
  });

  factory MainModel.fromJson(Map<String, dynamic> json) {
    print('object');
    return MainModel(
      dynamicView: List<DynamicViewModel>.from(json["dynamic_views"].map((e) => DynamicViewModel.fromJson(e))),
    );
  }
}
