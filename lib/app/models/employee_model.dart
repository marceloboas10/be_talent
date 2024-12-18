import 'dart:convert';

class EmployeeModel {
  final String id;
  final String name;
  final String role;
  final DateTime admissionDate;
  final String phone;
  final String image;

  EmployeeModel(
      {required this.id,
      required this.name,
      required this.role,
      required this.admissionDate,
      required this.phone,
      required this.image});

  factory EmployeeModel.fromMap(Map<String, dynamic> map) {
    return EmployeeModel(
        id: map['id'],
        name:
            map['name'] != null ? utf8.decode(map['name'].runes.toList()) : '',
        role:
            map['role'] != null ? utf8.decode(map['role'].runes.toList()) : '',
        admissionDate: DateTime.parse(map['admission_date']),
        phone: map['phone'],
        image: map['image']);
  }
}
