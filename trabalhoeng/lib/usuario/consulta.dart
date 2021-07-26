import 'package:flutter/material.dart';
import 'package:hasura_connect/hasura_connect.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: _carregando
              ? Center(
                  child: CircularProgressIndicator(),
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
                        Center(
                          child: Text(
                            'Listas de Usuários',
                            style: TextStyle(
                                fontSize: 23,
                                color: Colors.grey[900],
                                fontWeight: FontWeight.bold),
                          ),
                        ),
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
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ]),
                                  child: Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Nome: ${listUsers[index]['nome']}',
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: Colors.grey[900]),
                                          ),
                                          Text(
                                            'Cpf: ${listUsers[index]['cpf']}',
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: Colors.grey[900]),
                                          ),
                                          Text(
                                            'email: ${listUsers[index]['email']}',
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: Colors.grey[900]),
                                          ),
                                          Text(
                                            'endereco: ${listUsers[index]['endereco']}',
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: Colors.grey[900]),
                                          ),
                                          Text(
                                            'nascimento: ${listUsers[index]['nascimento']}',
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: Colors.grey[900]),
                                          ),
                                          Text(
                                            'rg: ${listUsers[index]['rg']}',
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: Colors.grey[900]),
                                          ),
                                          Text(
                                            'senha: ${listUsers[index]['senha']}',
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: Colors.grey[900]),
                                          ),
                                        ],
                                      ),
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
