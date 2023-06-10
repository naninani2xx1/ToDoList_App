// ignore_for_file: public_member_api_docs, sort_constructors_first, overridden_fields
part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {
  final String emailAddress;

  final String password;

  final String fullname;

  const AuthInitial({
    this.emailAddress = '',
    this.password = '',
    this.fullname = '',
  });

  @override
  List<Object> get props => [emailAddress, password, fullname];

  AuthInitial copyWith({
    String? emailAddress,
    String? password,
    String? fullname,
  }) {
    return AuthInitial(
      emailAddress: emailAddress ?? this.emailAddress,
      password: password ?? this.password,
      fullname: fullname ?? this.fullname,
    );
  }
}

class AuthLoading extends AuthState {}

class Authenticated extends AuthState {}

class AuthenticateError extends AuthState {
  final String message;

  const AuthenticateError(this.message);

  @override
  List<Object> get props => [message];
}
