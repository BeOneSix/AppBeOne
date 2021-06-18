import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  LoginState createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {
  String aviso = '';
  TextEditingController nome = TextEditingController();
  TextEditingController senha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('BeOne'),
              backgroundColor: Colors.blueGrey,
            ),
            body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: LayoutBuilder(builder: (BuildContext context1,
                    BoxConstraints viewportConstraints) {
                  return SingleChildScrollView(
                      child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: viewportConstraints.maxHeight,
                          ),
                          child: Container(
                              child: (Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                TextField(
                                    controller: nome,
                                    style: TextStyle(color: Colors.black),
                                    decoration: InputDecoration(
                                        labelText: "Usuário",
                                        labelStyle: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.black),
                                        hintText: "Informe o usuário")),
                                TextField(
                                    obscureText: true,
                                    controller: senha,
                                    style: TextStyle(color: Colors.black),
                                    decoration: InputDecoration(
                                        labelText: "Senha",
                                        labelStyle: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.black),
                                        hintText: "Informe a senha")),
                                Text('$aviso'),
                                Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            _validar(context);
                                          },
                                          child: Text('Login'),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.pushNamed(
                                                  context, '/cadastro1');
                                            },
                                            child: Text('Cadastrar')),
                                      ),
                                    ]),
                              ],
                            ),
                          )))));
                }))));
  }

  _validar(BuildContext context) {
    final _validaNome = nome.text;
    final _validaSenha = senha.text;
    final _mensagem = 'Usuário e/ou senha inválido(s)';
    String nomeTeste = 'ADM123';
    String senhaTeste = 'ADM123';
    if (_validaNome == nomeTeste && _validaSenha == senhaTeste) {
      return Navigator.pushNamed(context, '/home');
    } else {
      setState(() {
        aviso = _mensagem;
      });
    }
  }
}
