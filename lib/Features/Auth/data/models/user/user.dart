import 'department.dart';

class User {
  int id;
  String firstName;
  String lastName;
  String idCard;
  String userName;
  String phone;
  String? image;
  int? createdBy;
  Department? department;
  String role;
  bool? mustChangePassword;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.idCard,
    required this.userName,
    required this.phone,
    this.image,
    this.createdBy,
    this.department,
    required this.role,
    this.mustChangePassword,
  });

  @override
  String toString() {
    return 'User(id: $id, firstName: $firstName, lastName: $lastName, idCard: $idCard, userName: $userName, phone: $phone, image: $image, createdBy: $createdBy, department: $department, role: $role, mustChangePassword: $mustChangePassword)';
  }

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'] as int,
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    idCard: json['idCard'] as String,
    userName: json['userName'] as String,
    phone: json['phone'] as String,
    image: json['image'] as String,
    createdBy: json['createdBy'] as int,
    department:
        json['department'] == null
            ? null
            : Department.fromJson(json['department'] as Map<String, dynamic>),
    role: json['role'] as String,
    mustChangePassword: json['mustChangePassword'] as bool?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'firstName': firstName,
    'lastName': lastName,
    'idCard': idCard,
    'userName': userName,
    'phone': phone,
    'image': image,
    'createdBy': createdBy,
    'department': department?.toJson(),
    'role': role,
    'mustChangePassword': mustChangePassword,
  };
}
