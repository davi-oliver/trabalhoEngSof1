import 'package:animated_text/animated_text.dart';
import 'package:flutter/material.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:trabalhoeng/globals/globals.dart';

class ConsultaUser extends StatefulWidget {
  @override
  _ConsultaUserState createState() => _ConsultaUserState();
}

class _ConsultaUserState extends State<ConsultaUser> {
  HasuraConnect _hasuraConnect =
      HasuraConnect("https://trabalhoengsof.hasura.app/v1/graphql", headers: {
    'x-hasura-admin-secret':
        "TmuFKJIQLB78RF2Ir8asU5fiopyQj6cUE7CwoPP3kKWKQGTRpvswBB7SSqrLkcnm"
  });

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  var listUsers;
  bool _carregando = true;

  @override
  void initState() {
    super.initState();
    getDados();
  }

  Future getDados() async {
    _hasuraConnect.subscription(_listaUsers).then((value) {
      print(value);

      print(value.listen((event) {
        setState(() {
          listUsers = event['data']['usuarios'];
          _carregando = false;
        });
      }));
    });
    /*snapshot.listen((data) {
      print(data);
      setState(() {
        print(data['data']);
      });
    });*/
  }

  String _listaUsers = """
    subscription {
      usuarios {
        cpf
        cargo_id
        email
        endereco
        nascimento
        nome
        rg
        senha
      }
    }
  """;

  Future<bool> deleteInfo(codigo) async {
    try {
      var snapshot = _hasuraConnect.mutation(_deleteUser(codigo));

      snapshot.then((value) {
        print(value);
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  String _deleteUser(codigo) {
    return """
    mutation MyMutation {
      delete_usuarios(where: {_and: {cpf: {_eq: $codigo}}}) {
        returning {
          cargo_id
          cpf
          email
          endereco
          nascimento
          nome
          rg
          senha
        }
      }
    }""";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        title: Text(
          'Lista de Usuários',
          style: TextStyle(
              fontSize: 23,
              color: corTextoPrimario,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: _carregando
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
                        'Buscando usuários...',
                        'Aguarde',
                      ],
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontFamily: 'raleway',
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                )
              : listUsers.length == 0
                  ? Center(
                      child: Text(
                        "Nenhum Usuário Cadastrado",
                        style: TextStyle(fontSize: 17),
                      ),
                    )
                  : ListView(
                      shrinkWrap: true,
                      children: [
                        SizedBox(height: 25),
                        SizedBox(height: 25),
                        ListView.builder(
                          itemCount: listUsers.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (_, index) {
                            return Container(
                              child: TextButton(
                                onPressed: () {},
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  margin: EdgeInsets.fromLTRB(10, 15, 10, 15),
                                  decoration: BoxDecoration(
                                      color: Colors.white10,
                                      boxShadow: [kDefaultShadow]),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Nome: ${listUsers[index]['nome']}',
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  color: corTextoPrimario),
                                            ),
                                            Text(
                                              'Cpf: ${listUsers[index]['cpf']}',
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  color: corTextoPrimario),
                                            ),
                                            Text(
                                              'Email: ${listUsers[index]['email']}',
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  color: corTextoPrimario),
                                            ),
                                            Text(
                                              'Endereco: ${listUsers[index]['endereco']}',
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  color: corTextoPrimario),
                                            ),
                                            Text(
                                              'Nascimento: ${listUsers[index]['nascimento']}',
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  color: corTextoPrimario),
                                            ),
                                            Text(
                                              'RG: ${listUsers[index]['rg']}',
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  color: corTextoPrimario),
                                            ),
                                            Text(
                                              'Senha: ${listUsers[index]['senha']}',
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  color: corTextoPrimario),
                                            ),
                                          ],
                                        ),
                                      ),
                                      IconButton(
                                          icon: Icon(
                                            Icons.close,
                                            color: Colors.white,
                                          ),
                                          onPressed: () async {
                                            await deleteInfo(
                                                    listUsers[index]['cpf'])
                                                .then((value) {
                                              if (value) {
                                                _scaffoldKey.currentState
                                                    .showSnackBar(SnackBar(
                                                        content: Text(
                                                            "Usuário Removido com Sucesso!")));
                                                Navigator.of(context)
                                                    .pushReplacement(
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                ConsultaUser()));
                                              } else {
                                                _scaffoldKey.currentState
                                                    .showSnackBar(SnackBar(
                                                        content: Text(
                                                            "Erro na remoção")));
                                              }
                                            });
                                          }),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
        ),
      ),
    );
  }
}
