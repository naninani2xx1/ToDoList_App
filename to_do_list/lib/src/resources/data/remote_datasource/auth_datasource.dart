import 'package:to_do_list/common/params/signin.dart';
import 'package:to_do_list/core/base/success/success.dart';
import 'package:to_do_list/core/database/cloud_firebase.dart';

class AuthDataSource extends CloudFirebaseBase {
  AuthDataSource(super.collection);

  Future<SuccessHandler> createUserWithEmailAndPassword(
      SignInParams params) async {
    try {
      await addCollection(params.toJson());
      return const AuthSuccessHandler();
    } catch (e) {
      throw Exception(e);
    }
  }
}
