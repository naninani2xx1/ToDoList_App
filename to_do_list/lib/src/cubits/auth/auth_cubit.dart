import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:to_do_list/common/params/credentitals.dart';
import 'package:to_do_list/common/params/signin.dart';
import 'package:to_do_list/core/base/failure/error.dart';
import 'package:to_do_list/core/base/success/success.dart';
import 'package:to_do_list/src/resources/respository/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepositoryImpl authRepo;
  AuthCubit(this.authRepo) : super(const AuthInitial());

  void onChangedEmail(String input) {
    if (state is AuthInitial) {
      final authInitial = state as AuthInitial;
      emit(authInitial.copyWith(emailAddress: input));
    }
  }

  void onChangedPassword(String input) {
    if (state is AuthInitial) {
      final authInitial = state as AuthInitial;

      emit(authInitial.copyWith(password: input));
    }
  }

  void onChangedFullname(String input) {
    if (state is AuthInitial) {
      final authInitial = state as AuthInitial;
      emit(authInitial.copyWith(fullname: input));
    }
  }

  void submitLogin() async {
    final state = this.state;
    emit(AuthLoading());

    if (state is AuthInitial) {
      final params = CredentialsParams(
        emailAddress: state.emailAddress,
        password: state.password,
      );

      final result = await authRepo.signInWithEmailAndPassword(params);

      result.fold(
        (ErrorHandler errorHandler) {
          emit(AuthenticateError(errorHandler.logError));
          emit(AuthInitial(
              emailAddress: params.emailAddress, password: params.password));
        },
        (SuccessHandler successHandler) => emit(Authenticated()),
      );
    }
  }

  void submitSignUp() async {
    final state = this.state;
    emit(AuthLoading());

    if (state is AuthInitial) {
      final params = SignInParams(
        fullname: state.fullname,
        emailAddress: state.emailAddress,
        password: state.password,
      );

      final result = await authRepo.createUserWithEmailAndPassword(params);

      result.fold(
        (ErrorHandler errorHandler) {
          emit(AuthenticateError(errorHandler.logError));
          emit(AuthInitial(
              emailAddress: params.emailAddress,
              password: params.password,
              fullname: params.fullname));
        },
        (SuccessHandler successHandler) => emit(Authenticated()),
      );
    }
  }

  @override
  String toString() {
    super.toString();

    return 'AuthCubit: $state';
  }
}
