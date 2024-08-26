import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 0)
class User extends HiveObject {
  User({
    required this.email,
    required this.name,
    required this.gender,
    required this.phoneNumber,
    this.password,
    this.isLoggedIn = false,
  });
  @HiveField(0)
  String email;

  @HiveField(1)
  String name;

  @HiveField(2)
  String gender;

  @HiveField(3)
  String? password;

  @HiveField(4)
  String phoneNumber;

  @HiveField(5)
  bool? isVerified;

  @HiveField(6)
  bool? isLoggedIn;

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'name': name,
      'gender': gender,
      'phoneNumber': phoneNumber,
      'password': password,
      'isLoggedIn': isLoggedIn,
    };
  }
}
