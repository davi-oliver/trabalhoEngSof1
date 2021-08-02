import 'package:animated_text/animated_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:trabalhoeng/globals/globals.dart';
import 'package:trabalhoeng/home.dart';
import 'package:trabalhoeng/login/RecoverPage.dart';
import 'package:trabalhoeng/login/cadastro.dart';
import 'package:trabalhoeng/login/loginFunctions.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscurePass = false;
  bool entrando = false;

  _verSenhaLogin() {
    setState(() {
      obscurePass = !obscurePass;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: entrando
          ? Center(
              child: Container(
                color: kBackgroundColor,
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                child: AnimatedText(
                  alignment: Alignment.center,
                  speed: Duration(milliseconds: 1000),
                  controller: AnimatedTextController.loop,
                  displayTime: Duration(milliseconds: 900),
                  wordList: [
                    'Aguarde...',
                    'Estamos preparando',
                    'tudo para você!'
                  ],
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontFamily: 'raleway',
                      fontWeight: FontWeight.w700),
                ),
              ),
            )
          : Container(
              child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 150),
                    child: Image.asset(
                      'assets/logoApp.jpeg',
                      height: MediaQuery.of(context).size.height * .25,
                      width: MediaQuery.of(context).size.width * .5,
                    ),
                  ),
                  Text(
                    "Login",
                    style: TextStyle(
                        color: corTextoPrimario,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Raleway',
                        fontSize: sizeTextGrande),
                  ),
                  SizedBox(
                    height: 52,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Email",
                          style: TextStyle(
                              color: corTextoPrimario,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white38,
                        borderRadius: BorderRadius.circular(56)),
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    child: TextField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Email',
                          hintStyle: TextStyle(color: corTextoPrimario),
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.white,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Senha",
                          style: TextStyle(
                              color: corTextoPrimario,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white38,
                        borderRadius: BorderRadius.circular(56)),
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    child: TextField(
                      controller: senhaController,
                      keyboardType: TextInputType.text,
                      obscureText: obscurePass,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Senha',
                        hintStyle: TextStyle(color: corTextoPrimario),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.white,
                        ),
                        suffixIcon: GestureDetector(
                          onTap: _verSenhaLogin,
                          child: Icon(
                            obscurePass == true
                                ? Icons.visibility
                                : Icons.visibility_off,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 45, top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => RecoverPage())),
                          child: Text(
                            "Recuperar senha",
                            style: TextStyle(
                                color: corTextoPrimario,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () async {
                      if (senhaController.text.isNotEmpty &&
                          emailController.text.isNotEmpty) {
                        setState(() {
                          entrando = true;
                        });
                        await Future.delayed(Duration(seconds: 5));
                        setState(() {
                          entrando = false;
                        });
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => HomePage()));
                      }
                    },
                    child: botaoEnviar(!entrando ? "ENTRAR" : "Carregando..."),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Ainda não fez sua conta? ",
                          style: TextStyle(
                              color: corTextoPrimario,
                              fontFamily: "Raleway",
                              fontWeight: FontWeight.bold,
                              fontSize: sizeSubtitulo,
                              fontStyle: FontStyle.normal),
                          textAlign: TextAlign.center,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => CadastroUsuarioPage()));
                          },
                          child: Text(
                            "Crie já!",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                decorationStyle: TextDecorationStyle.solid,
                                decorationColor: kSecondaryColor,
                                color: kBlueColor,
                                fontFamily: "Raleway",
                                fontSize: sizeSubtitulo,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.normal),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    height: MediaQuery.of(context).size.height / 18,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Divider(color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )),
    );
  }

  Widget botaoEnviar(title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      width: MediaQuery.of(context).size.width * 0.6,
      height: MediaQuery.of(context).size.height * 0.065,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: kPrimaryColor,
          boxShadow: [kDefaultShadow]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            title,
            style: TextStyle(
                color: corTextoTerciaria,
                fontFamily: 'Raleway',
                fontSize: sizeTextoBotao,
                fontWeight: FontWeight.bold),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: corTextoTerciaria,
          )
        ],
      ),
    );
  }

  alertLoginErro() {
    var alertStyle = AlertStyle(
      animationType: AnimationType.fromTop,
      isCloseButton: false,
      isOverlayTapDismiss: false,
      descStyle: TextStyle(fontWeight: FontWeight.bold),
      animationDuration: Duration(milliseconds: 400),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(
          color: Colors.grey,
        ),
      ),
      titleStyle: TextStyle(
        color: kPrimaryColor,
        fontWeight: FontWeight.bold,
        fontSize: 25,
        fontFamily: "Raleway",
      ),
      //constraints: BoxConstraints.expand(width: 300),
      //First to chars "55" represents transparency of color
      overlayColor: Color(0x55000000),
    );

    // Alert dialog using custom alert style
    Alert(
      context: context,
      style: alertStyle,
      title: "Ops!",
      content: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Login Inválido!",
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: kTextSecondaryColor,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                child: Text(
                  "Verifique os campos Email e Senha ou clique em Recuperar Senha.",
                  style: TextStyle(
                    color: kTextSecondaryColor,
                    fontFamily: "quicksand",
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      )),
      buttons: [
        DialogButton(
          child: Text(
            "Fechar",
            style: TextStyle(
                color: Colors.white,
                fontFamily: "Raleway",
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
          },
          color: kSecondaryColor,
          radius: BorderRadius.circular(10.0),
        ),
        DialogButton(
          child: Text(
            "Recuperar",
            style: TextStyle(
                color: Colors.white,
                fontFamily: "Raleway",
                fontWeight: FontWeight.bold,
                fontSize: 15),
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => RecoverPage()));
          },
          color: kPrimaryColor,
          radius: BorderRadius.circular(10.0),
        ),
      ],
    ).show();
  }
}
