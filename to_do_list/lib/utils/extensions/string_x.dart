import 'package:bcrypt/bcrypt.dart';

extension StringX on String {
  bool isHasValueForm(bool value) {
    return isNotEmpty && !value;
  }

  bool isNotHasValueForm(bool value) {
    return isEmpty && value;
  }

  String hashPassword() {
    final String hashed = BCrypt.hashpw(this, BCrypt.gensalt());
    // $2a$10$r6huirn1laq6UXBVu6ga9.sHca6sr6tQl3Tiq9LB6/6LMpR37XEGu

    return hashed;
  }

  bool decryption(String password) {
    return BCrypt.checkpw(this, password);
  }

  bool get isValidEmail {
    // Kiểm tra xem chuỗi có rỗng hay không
    if (isEmpty) return false;

    // Kiểm tra xem chuỗi có phù hợp với yêu cầu đặc biệt không
    RegExp regex = RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$');
    return regex.hasMatch(this);
  }
}
