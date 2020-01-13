import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:provelop_app/User/bloc/bloc_user.dart';
import 'package:provelop_app/User/ui/screens/sing_in_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child:MaterialApp(
        title: 'Flutter Demo',
         home: SignInScreen(),
    ), 
      bloc: UserBloc() 
    ); 
  }
}
