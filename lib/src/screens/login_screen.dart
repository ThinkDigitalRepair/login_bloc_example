import 'package:flutter/material.dart';
import 'package:login_bloc/src/blocs/login_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          emailField(),
          passwordField(),
          Container(
            margin: EdgeInsets.only(top: 25),
          ),
          FlatButton(
            child: Text("Submit"),
            onPressed: () {
              loginBloc.dispatch(
                  AuthEvent(_emailController.text, _passController.text));
            },
          ),
          resultText()
        ],
      ),
    );
  }

  Widget emailField() {
    return StreamBuilder<String>(
      stream: loginBloc.email,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        return TextField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              hintText: 'you@example.com',
              labelText: 'Email Address',
              errorText: snapshot.error),
          onChanged: loginBloc.changeEmail,
        );
      },
    );
  }

  Widget passwordField() {
    return TextField(
      controller: _passController,
      decoration: InputDecoration(
          hintText: 'Enter Password', labelText: 'Enter Password'),
    );
  }

  Widget resultText() {
    return BlocBuilder<AuthEvent, bool>(
        bloc: loginBloc,
        builder: (context, snapshot) {
          return Text(snapshot ? "Login Success!" : "Login Failed");
        });
  }
}
