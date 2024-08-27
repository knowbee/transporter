import 'package:hive/hive.dart';
import 'package:transporter/data/models/authentication/user.dart';
import 'package:transporter/helpers/form_fields_validator.dart';
import 'package:transporter/services/security_service.dart';

class UserRepository {
  UserRepository({
    required this.userBox,
    required this.settingsBox,
    required this.securityService,
  });

  final Box<User> userBox;
  final Box<String> settingsBox;
  final SecurityService securityService;

  Future<User?> getCurrentUser() async {
    if (userBox.values.isEmpty) return null;

    final userEmail = getCurrentUserEmail();
    if (userEmail.isEmpty) return null;

    return getUserByEmail(userEmail);
  }

  Future<void> saveUserIdentifiers({
    required String email,
    required String phoneNumber,
  }) async {
    await settingsBox.put('userEmail', email);
    await settingsBox.put('userPhoneNumber', phoneNumber);
  }

  String getCurrentUserEmail() {
    return settingsBox.get('userEmail') ?? '';
  }

  Future<void> addUser(User user) async {
    await saveUserIdentifiers(email: user.email, phoneNumber: user.phoneNumber);
    await userBox.put(user.email, user);
  }

  User? getUserByEmail(String email) {
    return userBox.get(email);
  }

  User? getUserByPhone(String phoneNumber) {
    if (userBox.values.isEmpty) return null;
    return userBox.values
        .toList()
        .where(
          (user) => user.phoneNumber == phoneNumber,
        )
        .first;
  }

  Future<User?> authenticateUser(String identifier, String password) async {
    final user = isEmail(identifier)
        ? getUserByEmail(identifier)
        : getUserByPhone(identifier);

    if (user == null) return null;

    final isPasswordValid = await securityService.verifyPassword(
      password,
      user.password ?? '',
    );

    if (isPasswordValid) {
      user.isLoggedIn = true;
      await userBox.put(user.email, user);
      await saveUserIdentifiers(
        email: user.email,
        phoneNumber: user.phoneNumber,
      );
      return user;
    }
    return null;
  }

  Future<void> deleteUser(String email) async {
    await userBox.delete(email);
  }

  Future<User?> logoutUser(String email) async {
    final user = userBox.get(email);
    if (user == null) return null;

    user.isLoggedIn = false;
    await userBox.put(user.email, user);
    return user;
  }

  Future<User?> setNewPassword(String password) async {
    final userEmail = getCurrentUserEmail();
    final user = getUserByEmail(userEmail);

    if (user == null) return null;

    final hashedPassword = await securityService.hashPassword(password);
    user.password = hashedPassword;

    await userBox.put(user.email, user);
    return user;
  }
}
