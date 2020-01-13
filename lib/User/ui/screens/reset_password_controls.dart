import 'package:flutter/material.dart';

class ResetPasswordControls extends StatefulWidget {
  final VoidCallback onResetPassword;
  final void Function(String) handleEmailChange;


  ResetPasswordControls({
    Key key,
    @required this.onResetPassword,
    @required this.handleEmailChange,
  });

  @override
  State createState() {
    return _ResetPasswordControls();
  }
}

class _ResetPasswordControls extends State<ResetPasswordControls>{
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


    final resetButton = new Padding(
        padding: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
        child: SizedBox(
          height: 40.0,
          child: new RaisedButton(
            elevation: 5.0,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0)),
            color: Colors.blue,
            child: new Text('reset password',
                style: new TextStyle(fontSize: 20.0, color: Colors.white)),
            onPressed: widget.onResetPassword,
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
                resetButton
              ],
            )
          ],
        )
    );
  }
}
