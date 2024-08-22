import 'package:dbcrypt/dbcrypt.dart';
import 'package:flutter_bcrypt/flutter_bcrypt.dart';
import 'package:transporter/values/constants.dart';

class SecurityService {
  Future<String> hashPassword(String password) async {
    final salt =
        await FlutterBcrypt.saltWithRounds(rounds: Constants.saltRounds);
    final hashedPassword =
        await FlutterBcrypt.hashPw(password: password, salt: salt);
    return hashedPassword;
  }

  Future<bool> verifyPassword(String password, String hashedPassword) async {
    return DBCrypt().checkpw(password, hashedPassword);
  }
}
