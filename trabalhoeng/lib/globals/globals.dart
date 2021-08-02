import 'package:flutter/material.dart';

//Cores Gerais
var kBackgroundColor = Color.fromRGBO(14, 64, 71, 28);
var kPrimaryColor = Colors.greenAccent;
var kSecondaryColor = Color(0xFFFFA41B);
var kTextColor = Colors.black; //Color(0xFF000839);
var kTextSecondaryColor = Colors.grey[700];
var kTextLightColor = Color(0xFF747474);
var kBlueColor = const Color.fromRGBO(38, 110, 156, 1);
var kmulherColor = Colors.red[600];
var kTextFinalizar = Colors.green;
var kGreenColor = Colors.green[400];
var kSecurityColor = Colors.blue[700];

//Cores de Texto
var corTextoPrimario = Colors.white; // cor predominante = BRANCO
var corTextoSecundaria = Colors.lightBlueAccent; // cor Secundaria = AZUL CLARO
var corTextoTerciaria = Colors.black; // cor Terciaria = AZUL CLARO
var corTextoAlert = Colors.red; // cor Alert =  Vermelho

const kDefaultPadding = 20.0;

// our default Shadow
const kDefaultShadow = BoxShadow(
    color: Colors.black26,
    offset: Offset(4, 4),
    blurRadius: 4,
    spreadRadius: -2);

// variaveis de controle

var globalIdAnonimo;
var uidGlobal;
var user;

List listaServicos = List();

var tamanhoTextoTituloPrimario = 15.0;

//Tamanho Fontes
var sizeTitulo = 20.0;
var sizeSubtitulo = 12.0;
var sizeAppBar = 16.0;
var sizeTextGrande = 25.0;
var sizeTextMedio = 16.0;
var sizeText = 11.0;
var sizeTextoBotao = 14.0;
