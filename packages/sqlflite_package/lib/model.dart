class StudentModelFields {
  static const String id = "_id";
  static const String name = "name";
  static const String lastname = "lastname";
  static const String age = "age";

  static const String dbTable = "students";

}

class StudentModel {
  int? id;
  final String name;
  final String lastname;
  final String age;

  StudentModel({
    this.id,
    required this.name,
    required this.lastname,
    required this.age,
  });

  StudentModel copyWith({
    String? name,
    String? lastname,
    String? age,
    int? id,
  }) {
    return StudentModel(
      lastname: lastname ?? this.lastname,
      name: name ?? this.name,
      age: age ?? this.age,
      id: id ?? this.id,
    );
  }

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      lastname: json[StudentModelFields.lastname] ?? "",
      name: json[StudentModelFields.name] ?? "",
      age: json[StudentModelFields.age] ?? "",
      id: json[StudentModelFields.id] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      StudentModelFields.lastname: lastname,
      StudentModelFields.name: name,
      StudentModelFields.age: age,
    };
  }

  @override
  String toString() {
    return '''
      lastname: $lastname 
      name: $name
      age: $age 
      id: $id, 
    ''';
  }
}