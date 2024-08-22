import 'package:hive/hive.dart';
import 'package:transporter/data/models/authentication/user.dart';
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
    if (userBox.values.isEmpty) {
      return null;
    }
    final userEmail = getCurrentUserEmail();
    if (userEmail.isEmpty) {
      return null;
    }
    return getUserByEmail(userEmail);
  }

  Future<void> saveCurrentUserEmail(String currentUserEmail) async {
    await settingsBox.put('userEmail', currentUserEmail);
  }

  String getCurrentUserEmail() {
    return settingsBox.get('userEmail') ?? '';
  }

  Future<void> addUser(User user) async {
    await saveCurrentUserEmail(user.email);
    await userBox.put(user.email, user);
  }

  User? getUserByEmail(String email) {
    return userBox.get(email);
  }

  Future<User?> authenticateUser(String email, String password) async {
    final user = userBox.get(email);
    if (user != null) {
      final isPasswordValid =
          await securityService.verifyPassword(password, user.password ?? '');
      if (isPasswordValid) {
        user.isLoggedIn = true;
        await userBox.put(user.email, user);
        await saveCurrentUserEmail(email);
        return user;
      }
    }
    return null;
  }

  Future<void> deleteUser(String email) async {
    await userBox.delete(email);
  }

  Future<User?> logoutUser(String email) async {
    final user = userBox.get(email);
    if (user != null) {
      user.isLoggedIn = false;
      await userBox.put(user.email, user);
      return user;
    }
    return null;
  }

  Future<User?> verifyOTP(String otp) async {
    final userEmail = getCurrentUserEmail();
    final user = getUserByEmail(userEmail);
    if (user != null && otp == '12345') {
      user.isVerified = true;
      await userBox.put(user.email, user);
      return user;
    }
    return null;
  }

  Future<User?> setNewPassword(String password) async {
    final userEmail = getCurrentUserEmail();
    final user = getUserByEmail(userEmail);
    final hashedPassword = await securityService.hashPassword(password);
    if (user != null) {
      user.password = hashedPassword;
      await userBox.put(user.email, user);
      return user;
    }
    return null;
  }
}
