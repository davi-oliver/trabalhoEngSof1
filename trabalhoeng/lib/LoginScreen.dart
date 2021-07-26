import 'package:flutter/material.dart';
import 'package:trabalhoeng/usuario/cadastro.dart';
import 'package:trabalhoeng/usuario/consulta.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool carregando = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CadastroUsuarioPage()));
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(8)),
                padding: EdgeInsets.all(13),
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "Cadastrar Usuário",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 30),
            TextButton(
              onPressed: () async {
                print("dfasdfs");
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ConsultaUser()));
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(8)),
                padding: EdgeInsets.all(13),
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "Ver Usuários",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
