import 'package:equatable/equatable.dart';
import 'package:to_do_list/export.dart';

class SignInParams extends Equatable {
  const SignInParams({
    required this.fullname,
    required this.emailAddress,
    required this.password,
  });

  final String fullname;
  final String emailAddress;
  final String password;

  @override
  List<Object> get props => [fullname, emailAddress, password];

  Map<String, dynamic> toJson() => {
        'fullname': fullname,
        'emailAddress': emailAddress,
        'password': password.hashPassword(),
      };

  @override
  bool get stringify => false;
}
