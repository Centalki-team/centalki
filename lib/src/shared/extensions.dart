import 'package:dio/dio.dart';

extension IsOk on Response {
  bool get isOk => (statusCode ?? 0 ~/ 100) == 2;
}

extension PasswordValidate on String {
  /// regexp pattern r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[a-zA-Z\d\w\W]).{8,}$'

  bool get validatePassword {
    /// password rule: at least 1 uppercase, 1 numeric and 1 special character, min 8
    var pattern =
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$';
    return RegExp(pattern).hasMatch(this);
  }
}
