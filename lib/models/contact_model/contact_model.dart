
class ContactModelFields {
  static const String id = "_id";
  static const String name = "name";
  static const String surName = "surName";
  static const String phone = "phone";
  static const String contactsTable = "my_contacts";
}

class ContactModelSql {
  int? id;
  final String name;
  final String surName;
  final String phone;

  ContactModelSql({
    this.id,
    required this.phone,
    required this.name,
    required this.surName,
  });

  ContactModelSql copyWith({
    String? name,
    String? surName,
    String? phone,
    int? id,
  }) {
    return ContactModelSql(
      name: name ?? this.name,
      surName: name ?? this.surName,
      phone: phone ?? this.phone,
      id: id ?? this.id,
    );
  }

  factory ContactModelSql.fromJson(Map<String, dynamic> json) {
    return ContactModelSql(
      name: json[ContactModelFields.name] ?? "",
      surName: json[ContactModelFields.surName] ?? "",
      phone: json[ContactModelFields.phone] ?? "",
      id: json[ContactModelFields.id] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ContactModelFields.name: name,
      ContactModelFields.surName: surName,
      ContactModelFields.phone: phone,
    };
  }

  @override
  String toString() {
    return '''
      name: $name
      surName: $surName
      phone: $phone
      id: $id, 
    ''';
  }
}
