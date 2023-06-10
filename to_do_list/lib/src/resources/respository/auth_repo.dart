// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:to_do_list/common/params/credentitals.dart';
import 'package:to_do_list/common/params/signin.dart';
import 'package:to_do_list/core/base/failure/error.dart';
import 'package:to_do_list/core/base/success/success.dart';
import 'package:to_do_list/src/resources/data/remote_datasource/auth_datasource.dart';

abstract class AuthRepository {
  Future<Either<ErrorHandler, SuccessHandler>> createUserWithEmailAndPassword(
      SignInParams params);
  Future<Either<ErrorHandler, SuccessHandler>> signInWithEmailAndPassword(
      CredentialsParams params);
}

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource dataSource;

  AuthRepositoryImpl({
    required this.dataSource,
  });

  //handle
  @override
  Future<Either<ErrorHandler, SuccessHandler>> createUserWithEmailAndPassword(
      SignInParams params) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: params.emailAddress,
        password: params.password,
      );

      if (credential.user != null) {
        final results = await dataSource.createUserWithEmailAndPassword(params);

        return Right(results);
      }

      return const Left(AuthErrorHandler());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return const Left(
            AuthErrorHandler(error: 'The password provided is too weak'));
      }

      //e.code == 'email-already-in-use'
      return const Left(
          AuthErrorHandler(error: 'The account already exists for that email'));
    } catch (e) {
      return Left(AuthErrorHandler(error: e.toString()));
    }
  }

  @override
  Future<Either<ErrorHandler, SuccessHandler>> signInWithEmailAndPassword(
      CredentialsParams params) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: params.emailAddress, password: params.password);

      if (credential.user != null) {
        return const Right(AuthSuccessHandler());
      }

      return const Left(AuthErrorHandler());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return const Left(
            AuthErrorHandler(error: 'No user found for that email'));
      } else if (e.code == 'wrong-password') {
        return const Left(
            AuthErrorHandler(error: 'Wrong password provided for that user'));
      }
      return const Left(AuthErrorHandler(error: 'Something went wrong'));
    } catch (e) {
      return Left(AuthErrorHandler(error: e.toString()));
    }
  }
}
