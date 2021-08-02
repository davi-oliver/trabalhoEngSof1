import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trabalhoeng/home.dart';
import 'package:trabalhoeng/login/login.dart';
import 'package:trabalhoeng/login/loginFunctions.dart';

void main() => runApp(Splash());

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<LoginFunctions>(create: (_) => LoginFunctions(context)),
      ],
      child: MaterialApp(
        home: LoginPage(),
      ),
    );
  }
}

class Login {}
