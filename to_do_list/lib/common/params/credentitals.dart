import 'package:equatable/equatable.dart';

class CredentialsParams extends Equatable {
  const CredentialsParams({required this.emailAddress, required this.password});

  final String emailAddress;
  final String password;

  @override
  List<Object> get props => [emailAddress, password];

  Map<String, dynamic> toJson() => {
        'username': emailAddress,
        'password': password,
      };
  @override
  bool get stringify => false;

  @override
  String toString() {
    super.toString();
    return 'CredentialsParams: $emailAddress, $password';
  }
}
