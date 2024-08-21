part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class Unauthenticated extends AuthState {}

class Authenticated extends AuthState {
  const Authenticated({required this.user});
  final User user;

  @override
  List<Object?> get props => [user];
}

class AuthenticationFailed extends AuthState {}
