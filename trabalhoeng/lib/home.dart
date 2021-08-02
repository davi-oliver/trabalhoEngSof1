import 'package:flutter/material.dart';
import 'package:trabalhoeng/globals/globals.dart';
import 'package:trabalhoeng/login/cadastro.dart';
import 'package:trabalhoeng/usuario/consulta.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool carregando = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          backgroundColor: kBackgroundColor,
          title: Text(
            'Serviços',
            textAlign: TextAlign.center,
            style: TextStyle(color: corTextoPrimario),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Image.asset(
                  'assets/logoApp.jpeg',
                  height: MediaQuery.of(context).size.height * .25,
                  width: MediaQuery.of(context).size.width * .5,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CadastroUsuarioPage()));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2.4,
                        padding: EdgeInsets.only(top: 10),
                        height: 165,
                        decoration: BoxDecoration(
                            color: Colors.white38,
                            borderRadius: BorderRadius.circular(22),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(4, 4),
                                  blurRadius: 4,
                                  spreadRadius: -2)
                            ]),
                        child: Column(
                          children: [
                            Container(
                                margin: EdgeInsets.only(
                                    top: 10, left: 10, right: 6),
                                width: MediaQuery.of(context).size.width / 2.6,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Flexible(
                                        child: Text('Cadastrar Usuário',
                                            style: TextStyle(
                                                color: corTextoPrimario,
                                                fontSize: sizeTextoBotao,
                                                fontWeight: FontWeight.bold))),
                                  ],
                                )),
                            Expanded(
                              child: Container(
                                child: Image.asset(
                                  'assets/addUser.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                    width:
                                        MediaQuery.of(context).size.width * .09,
                                    height: MediaQuery.of(context).size.height *
                                        .04,
                                    decoration: BoxDecoration(
                                        color: kSecondaryColor,
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(22),
                                            topRight: Radius.circular(22)))),
                              ],
                            )
                          ],
                        ),
                      )),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ConsultaUser()));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2.4,
                        padding: EdgeInsets.only(top: 10),
                        height: 165,
                        decoration: BoxDecoration(
                            color: Colors.white38,
                            borderRadius: BorderRadius.circular(22),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(4, 4),
                                  blurRadius: 4,
                                  spreadRadius: -2)
                            ]),
                        child: Column(
                          children: [
                            Container(
                                margin: EdgeInsets.only(
                                    top: 10, left: 10, right: 6),
                                width: MediaQuery.of(context).size.width / 2.6,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Flexible(
                                        child: Text('Buscar Usuário',
                                            style: TextStyle(
                                                color: corTextoPrimario,
                                                fontSize: sizeTextoBotao,
                                                fontWeight: FontWeight.bold))),
                                  ],
                                )),
                            Expanded(
                              child: Container(
                                child: Image.asset(
                                  'assets/buscaUser.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                    width:
                                        MediaQuery.of(context).size.width * .09,
                                    height: MediaQuery.of(context).size.height *
                                        .04,
                                    decoration: BoxDecoration(
                                        color: kSecondaryColor,
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(22),
                                            topRight: Radius.circular(22)))),
                              ],
                            )
                          ],
                        ),
                      )),
                ],
              ),
              SizedBox(height: 30),
            ],
          ),
        ));
  }
}
