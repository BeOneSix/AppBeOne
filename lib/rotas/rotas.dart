import 'package:beone_app/Cadastro/TelaCadastro1.dart';
import 'package:beone_app/Cadastro/TelaCadastroCNPJ.dart';
import 'package:beone_app/chat/chat.dart';
import 'package:flutter/material.dart';

import '../login/TelaLogin.dart';
import '../home/TelaPrincipal.dart';
import '../Cadastro/TelaCadastroCPF.dart';
import '../Cadastro/TelaCadastroEndereco.dart';
import '../Cadastro/TelaCadastroPagamento.dart';

class Rotas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/login',
      routes: {
        '/login': (context) => Login(),
        '/home': (context) => Home(),
        '/cadastro1': (context) => Cadastro1(),
        '/cadastro2CPF': (context) => Cadastro2CPF(),
        '/cadastro2CNPJ': (context) => Cadastro2CNPJ(),
        '/cadastroEndereco': (context) => CadastroEndereco(),
        '/cadastroPagamento': (context) => CadastroPagamento(),
        '/chat': (context) => Chat(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
