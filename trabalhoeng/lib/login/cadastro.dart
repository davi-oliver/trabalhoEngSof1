import 'package:flutter/material.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:trabalhoeng/globals/globals.dart';
import 'package:trabalhoeng/home.dart';

import '../main.dart';

class CadastroUsuarioPage extends StatefulWidget {
  @override
  _CadastroUsuarioPageState createState() => _CadastroUsuarioPageState();
}

class _CadastroUsuarioPageState extends State<CadastroUsuarioPage> {
  HasuraConnect _hasuraConnect =
      HasuraConnect("https://trabalhoengsof.hasura.app/v1/graphql", headers: {
    'x-hasura-admin-secret':
        "TmuFKJIQLB78RF2Ir8asU5fiopyQj6cUE7CwoPP3kKWKQGTRpvswBB7SSqrLkcnm"
  });

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  var cargo_id = TextEditingController();
  var cpf = TextEditingController();
  var email = TextEditingController();
  var endereco = TextEditingController();
  var nascimento = TextEditingController();
  var nome = TextEditingController();
  var rg = TextEditingController();
  var senha = TextEditingController();

  String _insertUser() {
    return """
    mutation MyMutation {
      insert_usuarios(objects: {cargo_id: "${cargo_id.text}", cpf: "${cpf.text}", email: "${email.text}", endereco: "${endereco.text}", nascimento: "${nascimento.text}", nome: "${nome.text}", rg: "${rg.text}", senha: "${senha.text}"}) {
        returning {
          cpf
          cargo_id
          nome
        }
      }
    }

    """;
  }

  Future<bool> createState() async {
    try {
      print("nascimento.text: ${nascimento.text}");
      var aux = nascimento.text.split('/');
      nascimento.text = aux[2] + "-" + aux[1] + "-" + aux[0];

      print("nascimento.text: ${nascimento.text}");

      var data = await _hasuraConnect.mutation(_insertUser());

      print(data);
      if (data != null) {
        return true;
      }
    } catch (e) {
      return false;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      key: _scaffoldKey,
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 30,
                ),
                IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white70,
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Cadastro de Usuários",
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 20),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 40,
                ),
                Text(
                  "Cargo Id",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white38,
                  borderRadius: BorderRadius.circular(56)),
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                controller: cargo_id,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: ' *Cadastro Id',
                ),
              ),
            ),
            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 40,
                ),
                Text(
                  "CPF",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white38,
                  borderRadius: BorderRadius.circular(56)),
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                controller: cpf,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: ' *CPF',
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 40,
                ),
                Text(
                  "Email",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white38,
                  borderRadius: BorderRadius.circular(56)),
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                controller: email,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: ' *email',
                ),
              ),
            ),

            /// endereco
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 40,
                ),
                Text(
                  "Endereço",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white38,
                  borderRadius: BorderRadius.circular(56)),
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                controller: endereco,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: ' *Endereco',
                ),
              ),
            ),

            /// NASCIMENTO
            ///

            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 40,
                ),
                Text(
                  "Data Nascimento",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white38,
                  borderRadius: BorderRadius.circular(56)),
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                controller: nascimento,
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: ' *Nascimento',
                ),
              ),
            ),

            /// NOME
            ///

            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 40,
                ),
                Text(
                  "Nome",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white38,
                  borderRadius: BorderRadius.circular(56)),
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                controller: nome,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: ' *nome',
                ),
              ),
            ),

            /// RG
            ///

            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 40,
                ),
                Text(
                  "RG",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white38,
                  borderRadius: BorderRadius.circular(56)),
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                controller: rg,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: ' *rg',
                ),
              ),
            ),

            /// senha
            ///

            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 40,
                ),
                Text(
                  "Senha",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white38,
                  borderRadius: BorderRadius.circular(56)),
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                controller: senha,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: ' *senha',
                ),
              ),
            ),
            SizedBox(height: 30),

            TextButton(
              onPressed: () async {
                print("dfasdfs");
                await createState().then((value) {
                  if (value) {
                    _scaffoldKey.currentState.showSnackBar(SnackBar(
                        content: Text("Usuário Inserido com Sucesso!")));
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => HomePage()));
                  } else {
                    _scaffoldKey.currentState.showSnackBar(
                        SnackBar(content: Text("Erro na inserção")));
                  }
                });
              },
              child: Container(
                decoration: BoxDecoration(
                    color: kSecondaryColor,
                    borderRadius: BorderRadius.circular(8)),
                padding: EdgeInsets.all(13),
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "Cadastrar",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
