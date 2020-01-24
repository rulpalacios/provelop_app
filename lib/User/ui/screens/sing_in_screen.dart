import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:provelop_app/User/bloc/bloc_user.dart';
import 'package:provelop_app/User/model/user.dart';
import 'package:provelop_app/platzi_trips_cupertino.dart';
import 'package:provelop_app/widgets/gradient_back.dart';
import 'package:provelop_app/widgets/gradient_button.dart';
import 'package:provelop_app/User/ui/screens/sign_in_controls.dart';
import 'package:provelop_app/User/ui/screens/sign_up_controls.dart';
import 'package:provelop_app/User/ui/screens/reset_password_controls.dart';

class SignInScreen extends StatefulWidget {

  @override
  State createState(){
    return _SignInScreen();
  }
}

class _SignInScreen extends State<SignInScreen>{
  UserBloc userBloc;
  String _email;
  String _password;
  String _username;
  String _screen = "login";

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    return _handleCurrentSession();
  }
  Widget _handleCurrentSession(){
    return StreamBuilder(
      stream: userBloc.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        // snapshot contiene el objeto user
        if(!snapshot.hasData || snapshot.hasError){
          return signInUI();
        } else {
          return PlatziTripsCupertino();
        }
      },
    );
  }

  Widget loginUI(){
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Stack(
       alignment: Alignment.center,
        children: <Widget>[
          GradientBack("", null),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
               SignInControls(
                handlePasswordChange: (String password) => this._password = password,
                handleEmailChange: (String email) => this._email = email,
                onLogin: (){
                  userBloc.signInWithEmail(this._email, this._password);
                  print("Email: ${this._email} Password: ${this._password}");
                }
              ),
              FlatButton(
                onPressed: (){
                  setState(() {
                    _screen = "reset_password";
                  });
                },
                child: Text(
                  "Olvide mi contraseña"
                ),
              ),
              GradientButton(text: "Login with Gmail",
                onPressed: (){
                  userBloc.signOut();
                  userBloc.signIn().then((FirebaseUser user){
                    userBloc.updateUserData(User(
                      uid: user.uid,
                      name: user.displayName,
                      email: user.email,
                      photoURL: user.photoUrl
                    ));
                  });
                },
                width: 300.0,
                height: 50.0,
                fromColor: Color(0xFFD44638),
                toColor: Color(0xFFD44638),
              ),
              GradientButton(text: "Login with Facebook",
                onPressed: (){
                  userBloc.signOut();
                  userBloc.signInWithFacebook().then((FirebaseUser user) => print("El usuario es ${user.displayName}"));
                },
                width: 300.0,
                height: 50.0,
                fromColor: Color(0xFF3B5998),
                toColor: Color(0xFF3B5998),
              ),
              FlatButton(
                onPressed: (){
                  setState(() {
                    _screen = "signup";
                  });
                },
                child: Text(
                    "Registrarme"
                ),
              ),
            ]
          )
        ],
      )
    );
  }

  Widget resetPassword(){
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            GradientBack("", null),
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ResetPasswordControls(
                      handleEmailChange: (String email) => this._email = email,
                      onResetPassword: (){
                        userBloc.resetPassword(this._email);
                        print("Email: ${this._email}");
                      }
                  ),
                  FlatButton(
                    onPressed: (){
                      setState(() {
                        _screen = "login";
                      });
                    },
                    child: Text(
                        "Volver"
                    ),
                  ),
                ]
            ),
          ],
        )
    );
  }

  Widget signUpUI(){
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            GradientBack("", null),
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SignUpControls(
                      handlePasswordChange: (String password) => this._password = password,
                      handleEmailChange: (String email) => this._email = email,
                      handleUsernameChange: (String username) => this._username = username,
                      onSignUp: (){
                        userBloc.signUp(this._email, this._password, this._username);
                        print("Email: ${this._email} Password: ${this._password}");
                      }
                  ),
                  FlatButton(
                    onPressed: (){
                      setState(() {
                        _screen = "login";
                      });
                    },
                    child: Text(
                        "Volver"
                    ),
                  ),
                ]
            ),
          ],
        )
    );
  }
  Widget signInUI() {
    switch (_screen) {
      case "login":
        return loginUI();
      case "reset_password":
        return resetPassword();
      case "signup":
        return signUpUI();
    }
  }
}