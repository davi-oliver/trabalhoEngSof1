import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:trabalhoeng/globals/globals.dart';
import 'package:trabalhoeng/home.dart';
import 'package:trabalhoeng/login/cadastro.dart';

TextEditingController emailController = TextEditingController();
TextEditingController senhaController = TextEditingController();
var userName, userUid;

class LoginFunctions {
  BuildContext context;
  LoginFunctions(this.context);
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  Future<bool> result() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      // nao tem conexao
      return false;
    } else {
      // tem conexao
      return true;
    }
  }

  Future singInEmail() async {
    print("Senha log > ${senhaController.text}");
    print('Email log > ${emailController.text}');

    bool resultadoConexao = await result();

    if (resultadoConexao == true) {
      print('Verificando ....');
      print(senhaController.text == null
          ? "null"
          : "Functions email ${emailController.text}");
      print(senhaController == null
          ? "null"
          : "Functions senha ${senhaController.text}");

      final AuthResult user = await auth.signInWithEmailAndPassword(
          email: '${emailController.text}',
          password: '${senhaController.text}');
      print("singd in " + user.user.email);

      final notesReference = FirebaseDatabase.instance
          .reference()
          .child('userProfile/${user.user.uid}');
      await notesReference.once().then((DataSnapshot snapshot) async {
        userName = snapshot.value['name'];
        userUid = user.user.uid;
      });

      print("UIDLOGINEMAIL>> $userUid");
    } else {
      alertconexao();

      return;
    }

    Navigator.pushReplacement(
      context,
      new MaterialPageRoute(
        builder: (context) => HomePage(),
      ),
    );

    return;
  }

  Future signInGoogle() async {
    bool resultadoConexao = await result();

    if (resultadoConexao == true) {
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      print(credential);
      final AuthResult user = await auth.signInWithCredential(credential);
      print("signed in " + user.user.displayName);
      userUid = user.user.uid;

      userName = user.user.displayName;
    } else {
      alertconexao();

      return;
    }

    return;
  }

  alertconexao() {
    var alertStyle = AlertStyle(
      animationType: AnimationType.fromRight,
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
        children: [
          Text(
            "Verifique sua conexão com a internet !",
            style: TextStyle(
              color: kTextSecondaryColor,
              fontFamily: "quicksand",
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      )),
      buttons: [
        DialogButton(
          child: Text(
            "Okay",
            style: TextStyle(
                color: Colors.white,
                fontFamily: "Raleway",
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          onPressed: () async {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => CadastroUsuarioPage()));
          },
          color: kSecondaryColor,
          radius: BorderRadius.circular(10.0),
        ),
      ],
    ).show();
  }
}
