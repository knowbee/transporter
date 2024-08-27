import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transporter/data/models/authentication/user.dart';
import 'package:transporter/data/repositories/user_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.userRepository}) : super(Unauthenticated());
  final UserRepository userRepository;

  Future<void> checkAuthState() async {
    try {
      final user = await userRepository.getCurrentUser();
      if (user != null) {
        emit(Authenticated(user: user));
      } else {
        emit(Unauthenticated());
      }
    } catch (e) {
      emit(Unauthenticated());
    }
  }

  Future<void> logIn({
    required String email,
    required String password,
  }) async {
    try {
      final user = await userRepository.authenticateUser(email, password);
      if (user != null) {
        emit(Authenticated(user: user));
      } else {
        emit(AuthenticationFailed());
      }
    } catch (e) {
      emit(AuthenticationFailed());
    }
  }

  Future<void> logOut({required String email}) async {
    await userRepository.logoutUser(email);
    emit(Unauthenticated());
  }

  Future<void> signUp({
    required String name,
    required String email,
    required String phoneNumber,
    required String gender,
  }) async {
    final existingUser = userRepository.getUserByEmail(email);
    final newUser = User(
      name: name,
      email: email,
      phoneNumber: phoneNumber,
      gender: gender,
    );

    if (existingUser == null) {
      await userRepository.addUser(newUser);
      emit(
        Authenticated(
          user: newUser,
        ),
      );
    } else {
      emit(AuthenticationFailed());
    }
  }

  Future<void> verifyOTP(String otp) async {
    try {
      final user = await userRepository.verifyOTP(otp);
      if (user != null) {
        emit(Authenticated(user: user));
      } else {
        emit(AuthenticationFailed());
      }
    } catch (e) {
      emit(AuthenticationFailed());
    }
  }

  Future<void> setNewPassword({
    required String password,
  }) async {
    try {
      final user = await userRepository.setNewPassword(password);
      if (user != null) {
        emit(Authenticated(user: user));
      } else {
        emit(AuthenticationFailed());
      }
    } catch (e) {
      emit(AuthenticationFailed());
    }
  }
}
