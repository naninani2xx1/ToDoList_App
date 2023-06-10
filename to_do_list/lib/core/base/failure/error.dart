import 'package:equatable/equatable.dart';

abstract class ErrorHandler extends Equatable {
  const ErrorHandler(String error) : _error = error;

  final String _error;

  String get logError => _error;
}

class InternetErrorHandler extends ErrorHandler {
  const InternetErrorHandler({String error = 'Internet Error'}) : super(error);

  @override
  List<Object?> get props => [];
}

class AuthErrorHandler extends ErrorHandler {
  const AuthErrorHandler({String error = 'Auth errors'}) : super(error);
  @override
  List<Object?> get props => [];
}
