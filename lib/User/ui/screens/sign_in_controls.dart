import 'package:flutter/material.dart';

class SignInControls extends StatefulWidget {
  final VoidCallback onLogin;
  final void Function(String) handlePasswordChange;
  final void Function(String) handleEmailChange;

  SignInControls({
    Key key,
    @required this.onLogin,
    @required this.handlePasswordChange,
    @required this.handleEmailChange
  });

  @override
  State createState() {
    return _SignInControls();
  }
}

  class _SignInControls extends State<SignInControls>{
    @override
    Widget build(BuildContext context) {
      // TODO: implement build
      final mailControl =  TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.email),
          hintText: "Email",
        ),
        onChanged: (text) => widget.handleEmailChange(text),
    );

    final passwordControl =  TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key),
        hintText: "Password",
      ),
      onChanged: (text) => widget.handlePasswordChange(text),
    );

    final loginButton = new Padding(
          padding: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
          child: SizedBox(
            height: 40.0,
            child: new RaisedButton(
              elevation: 5.0,
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0)),
              color: Colors.blue,
              child: new Text('Login',
                  style: new TextStyle(fontSize: 20.0, color: Colors.white)),
              onPressed: widget.onLogin,
            ),
          )
      );
    return Container(
        width: 300.0,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                mailControl,
                passwordControl,
                loginButton
              ],
            )
          ],
        )
    );
  }
  }
