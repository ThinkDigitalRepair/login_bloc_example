import 'dart:async';
import 'package:bloc/bloc.dart';

import 'validators.dart';

class LoginBloc extends Bloc<AuthEvent, bool> with Validators {
  final _email = StreamController<String>.broadcast();
  final _password = StreamController<String>.broadcast();

  // Add data to stream
  Stream<String> get email => _email.stream.transform(validateEmail);

  Stream<String> get password => _email.stream.transform(validateEmail);

  // Change data
  Function(String) get changeEmail => _email.add;

  Function(String) get changePassword => _password.add;
  Stream<bool> validStream = Stream.empty();

  dispose() {
    _email.close();
    _password.close();
  }

  @override
  get initialState => false;

  @override
  Stream<bool> mapEventToState(currentState, event) async* {
    if (event.username == "test@test.com" && event.pass == "pass") {
      yield true;
    } else
      yield false;
  }

  @override
  void onTransition(Transition<AuthEvent, bool> transition) {
    print(transition);
  }
}

final loginBloc = LoginBloc();

class AuthEvent {
  final String username;
  final String pass;

  AuthEvent(this.username, this.pass);

  @override
  String toString() => "Username: $username, Pass: $pass";
}
