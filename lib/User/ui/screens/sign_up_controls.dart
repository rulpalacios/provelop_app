import 'package:flutter/material.dart';
import 'package:provelop_app/User/ui/screens/user_location.dart';

class SignUpControls extends StatefulWidget {
  final VoidCallback onSignUp;
  final void Function(String) handlePasswordChange;
  final void Function(String) handleEmailChange;
  final void Function(String) handleUsernameChange;

  SignUpControls({
    Key key,
    @required this.onSignUp,
    @required this.handlePasswordChange,
    @required this.handleEmailChange,
    @required this.handleUsernameChange
  });

  @override
  State createState() {
    return _SignUpControls();
  }
}

class _SignUpControls extends State<SignUpControls>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final usernameControl =  TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.account_circle),
        hintText: "Username",
      ),
      onChanged: (text) => widget.handleUsernameChange(text),
    );

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
            child: new Text('Signup',
                style: new TextStyle(fontSize: 20.0, color: Colors.white)),
            onPressed: widget.onSignUp,
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
                usernameControl,
                mailControl,
                passwordControl,
                loginButton,
                Container(
                  margin: EdgeInsets.only(
                    top: 30.0,
                  ),
                  height: 200.0,

                  child: MapLocation(),
                ),
              ],
            )
          ],
        )
    );
  }
}
