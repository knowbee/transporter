import 'package:hive/hive.dart';
import 'package:transporter/data/models/authentication/user.dart';

class UserRepository {
  UserRepository({required this.userBox});
  final Box<User> userBox;

  Future<User?> getCurrentUser() async {
    if (userBox.values.isEmpty) {
      return null;
    }
    return userBox.values.first;
  }

  Future<void> addUser(User user) async {
    await userBox.put(user.email, user);
  }

  User? getUserByEmail(String email) {
    return userBox.get(email);
  }

  Future<User?> authenticateUser(String email, String password) async {
    final user = userBox.get(email);
    if (user != null && user.password == password) {
      user.isLoggedIn = true;
      await userBox.put(user.email, user);
      return user;
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
    final user = await getCurrentUser();
    if (user != null && otp == '12345') {
      user.isVerified = true;
      await userBox.put(user.email, user);
      return user;
    }
    return null;
  }

  Future<User?> setNewPassword(String password) async {
    final user = await getCurrentUser();
    if (user != null) {
      user.password = password;
      await userBox.put(user.email, user);
      return user;
    }
    return null;
  }
}
