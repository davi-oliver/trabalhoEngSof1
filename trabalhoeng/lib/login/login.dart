import 'package:flutter/material.dart';
import 'package:trabalhoeng/globals/globals.dart' as globalsVars;
import 'package:trabalhoeng/login/cadastro.dart';
import 'package:trabalhoeng/login/loginScreen.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool carregando = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: globalsVars.kBackgroundColor,
      body: carregando
          ? Center(
              child: CircularProgressIndicator(
                valueColor:
                    AlwaysStoppedAnimation<Color>(globalsVars.kBackgroundColor),
                backgroundColor: globalsVars.kPrimaryColor,
              ),
            )
          : Container(
              height: size.height,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 150),
                      child: Image.asset(
                        'assets/logoApp.jpeg',
                        height: MediaQuery.of(context).size.height * .25,
                        width: MediaQuery.of(context).size.width * .5,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Container(
                        child: Text(
                          "Bem vindo",
                          style: TextStyle(
                              color: globalsVars.kPrimaryColor,
                              fontSize:
                                  MediaQuery.of(context).size.height * .03,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Raleway'),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 52,
                    ),
                    GestureDetector(
                      child: Container(
                        width: size.width * 0.8,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: globalsVars.kPrimaryColor,
                            borderRadius: BorderRadius.circular(50)),
                        child: Text(
                          "Login",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: globalsVars.corTextoTerciaria,
                              fontWeight: FontWeight.bold,
                              fontSize: globalsVars.sizeTextMedio,
                              fontFamily: 'Raleway'),
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => LoginScreen()));
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      child: Container(
                        width: size.width * 0.8,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: globalsVars.kSecondaryColor,
                            borderRadius: BorderRadius.circular(50)),
                        child: Text(
                          "Criar Conta",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: globalsVars.corTextoTerciaria,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Raleway'),
                        ),
                      ),
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CadastroUsuarioPage())),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .05,
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
