class UserModel {
  final int? id;
  final String firstname;
  final String lastname;
  final String age;
  final String gender;
  final String job;

  UserModel({
    this.id,
    required this.firstname,
    required this.lastname,
    required this.age,
    required this.gender,
    required this.job,
  });

  UserModel copyWith({
    int? id,
    String? firstname,
    String? lastname,
    String? age,
    String? gender,
    String? job,
  }) =>
      UserModel(
        id: id ?? this.id,
        firstname: firstname ?? this.firstname,
        lastname: lastname ?? this.lastname,
        age: age ?? this.age,
        gender: gender ?? this.gender,
        job: job ?? this.job,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json[UserModelFields.id] as int? ?? 0,
      firstname: json[UserModelFields.firstname] as String? ?? '',
      lastname: json[UserModelFields.lastname] as String? ?? '',
      age: json[UserModelFields.age] as String? ?? '',
      gender: json[UserModelFields.gender] as String? ?? '',
      job: json[UserModelFields.job] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      UserModelFields.id: id,
      UserModelFields.firstname: firstname,
      UserModelFields.lastname: lastname,
      UserModelFields.age: age,
      UserModelFields.gender: gender,
      UserModelFields.job: job,
    };
  }

  @override
  String toString() {
    return '''
      id: $id,
      firstname: $firstname,
      lastname: $lastname,
      age: $age,
      gender: $gender,
      job: $job,
    ''';
  }
}

class UserModelFields {
  static String id = 'id';
  static String firstname = 'firstname';
  static String lastname = 'lastname';
  static String age = 'age';
  static String gender = 'gender';
  static String job = 'job';

  static String table = 'user_table';
}
