import 'package:equatable/equatable.dart';

abstract class SuccessHandler extends Equatable {
  const SuccessHandler(this.message);

  final String message;

  String showMessage() => message;
}

class AuthSuccessHandler extends SuccessHandler {
  const AuthSuccessHandler({String messsage = 'Alert successfully logged in'})
      : super(messsage);

  @override
  List<Object?> get props => [];
}
