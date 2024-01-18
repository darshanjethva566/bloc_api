import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prac_demo/view/home/home_screen.dart';
import 'package:prac_demo/view/spashscreen/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bloc/bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final shar = await SharedPreferences.getInstance();

  runApp( MyApp(login: shar.getString('login')==null?'0':'1',));
}

class MyApp extends StatelessWidget {
  var login;


  MyApp({this.login});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ApiBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: login=='1'?Home_Screen():Splash_Screen(),
      ),
    );
  }
}

