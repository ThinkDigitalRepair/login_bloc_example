import 'package:flutter_test/flutter_test.dart';
import 'package:login_bloc/src/blocs/login_bloc.dart';

main() {
  final loginBloc = LoginBloc();
  test("test that the login bloc fails with incorrect values", () {
    expectLater(loginBloc.state, emits(false));
    loginBloc.dispatch(AuthEvent("test", "pasdfdfd"));
  });
  test("test that the login bloc succeeds with correct values", () {
    expectLater(loginBloc.state, emitsThrough(true));
    loginBloc.dispatch(AuthEvent("test@test.com", "pass"));
  });
}
