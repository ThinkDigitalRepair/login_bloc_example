import 'dart:async';
import 'validators.dart';

class Bloc with Validators {
  final _email = StreamController<String>();
  final _password = StreamController<String>();

  // Add data to stream
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _email.stream.transform(validateEmail);

  // Change data
  Function(String) get changeEmail => _email.add;
  Function(String) get changePassword => _password.add;

  dispose() {
    _email.close();
    _password.close();
  }
}
