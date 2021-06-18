import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:cpf_cnpj_validator/cpf_validator.dart';

class Cadastro2CPF extends StatefulWidget {
  @override
  _CadastroState2CPF createState() {
    return _CadastroState2CPF();
  }
}

class _CadastroState2CPF extends State<Cadastro2CPF> {
  final _formKey = GlobalKey<FormState>();
  var textData = TextEditingController();
  var maskData = new MaskTextInputFormatter(
      mask: '##/##/####', filter: {"#": RegExp(r'[0-9]')});
  var textCPF = TextEditingController();
  var maskCPF = new MaskTextInputFormatter(
      mask: '###.###.###-##', filter: {'#': RegExp(r'[0-9]')});

  var textEmail = TextEditingController();
  var textSenha = TextEditingController();
  var textSenhaVer;
  final List<String> sexoList = [
    'Selecione',
    'Masculino',
    'Feminino',
    'Prefiro não dizer'
  ];
  var sexoSelect;
  String erro = '';

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
                          child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            TextFormField(
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                labelText: "Nome Completo",
                                labelStyle: TextStyle(
                                    fontSize: 15, color: Colors.black),
                                hintText: "Informe seu nome",
                              ),
                              validator: (nome) {
                                if (nome == '') {
                                  return "Informe o nome completo";
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                  labelText: "CPF",
                                  labelStyle: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                  hintText: "Informe seu CPF"),
                              validator: (cpf) {
                                if (cpf == '') {
                                  return "Informe o CPF";
                                }
                                if (!CPFValidator.isValid(textCPF.text)) {
                                  return ("Este CPF é inválido");
                                }
                                return null;
                              },
                              controller: textCPF,
                              inputFormatters: [maskCPF],
                            ),
                            TextFormField(
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                  labelText: "Data de nascimento",
                                  labelStyle: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                  hintText: "Informe sua data de nascimento"),
                              validator: (data) {
                                List<String> resultData =
                                    textData.text.split(new RegExp(r'/+'));
                                if (data == '') {
                                  return "Informe a data de nascimento";
                                }
                                if (textData.text.length < 10) {
                                  return "Tamanho inválido";
                                }
                                if (int.parse(resultData[2]) <= 0 ||
                                    int.parse(resultData[2]) > 2021 ||
                                    int.parse(resultData[1]) > 12 ||
                                    int.parse(resultData[1]) < 01 ||
                                    int.parse(resultData[0]) > 31 ||
                                    int.parse(resultData[0]) < 1) {
                                  return 'Data inválida';
                                } else {
                                  if (int.parse(resultData[1]) == 02) {
                                    if (int.parse(resultData[2]) % 4 == 0) {
                                      if (int.parse(resultData[0]) > 29) {
                                        return 'Data inválida';
                                      }
                                    } else {
                                      if (int.parse(resultData[0]) > 28) {
                                        return 'Data inválida';
                                      }
                                    }
                                  }
                                  if (int.parse(resultData[1]) == 04 ||
                                      int.parse(resultData[1]) == 06 ||
                                      int.parse(resultData[1]) == 09 ||
                                      int.parse(resultData[1]) == 11) {
                                    if (int.parse(resultData[0]) > 30) {
                                      return 'Data inválida';
                                    }
                                  }
                                }
                              },
                              controller: textData,
                              inputFormatters: [maskData],
                            ),
                            TextFormField(
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                  labelText: "Email",
                                  labelStyle: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                  hintText: "Informe seu email"),
                              controller: textEmail,
                              validator: (email) {
                                bool emailV = false;
                                List<String> resultEmail =
                                    textEmail.text.split('');
                                if (email == '') {
                                  return "Informe um email";
                                } else {
                                  for (int i = 0; i < resultEmail.length; i++) {
                                    if (resultEmail[i] == '@') {
                                      emailV = true;
                                    }
                                  }
                                  if (emailV == true) {
                                    return null;
                                  } else {
                                    return "Insira um email válido";
                                  }
                                }
                              },
                            ),
                            TextFormField(
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                  labelText: "Senha",
                                  labelStyle: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                  hintText: "Informe uma senha"),
                              controller: textSenha,
                              validator: (senha) {
                                if (senha == '') {
                                  return 'Insira uma senha';
                                }
                                if (textSenha.text.length >= 10 &&
                                    textSenha.text.contains(RegExp(r'\W')) &&
                                    RegExp(r'\d+\w*\d+')
                                        .hasMatch(textSenha.text)) {
                                  return null;
                                } else {
                                  return 'A senha deve conter: ter pelo menos 10 dígitos, letras, números e pelo menos um caractere especial';
                                }
                              },
                            ),
                            TextFormField(
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                    labelText: "Confirmar senha",
                                    labelStyle: TextStyle(
                                        fontSize: 15, color: Colors.black),
                                    hintText: "Confirme a senha"),
                                controller: textSenhaVer,
                                validator: (senhaV) {
                                  if (senhaV == '') {
                                    return 'Repita a senha';
                                  }
                                  if (senhaV == textSenha.text) {
                                    return null;
                                  } else {
                                    return 'As duas senhas devem ser iguais';
                                  }
                                }),
                            DropdownButtonFormField(
                              value: sexoList[0],
                              items: sexoList.map((sexoType) {
                                return DropdownMenuItem(
                                  value: sexoType,
                                  child: Text(sexoType),
                                );
                              }).toList(),
                              onChanged: (val) {
                                setState(() {
                                  sexoSelect = val;
                                  if (sexoSelect != 'Selecione') {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text('Processing Data')));
                                    Navigator.pushNamed(
                                        context, '/cadastroEndereco');
                                    setState(() {
                                      erro = '';
                                    });
                                  } else {
                                    setState(() {
                                      erro = 'Selecione uma opção válida';
                                    });
                                  }
                                });
                              },
                            ),
                            Text('$erro'),
                            ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  // If the form is valid, display a snackbar. In the real world,
                                  // you'd often call a server or save the information in a database.
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text('Processing Data')));
                                  Navigator.pushNamed(
                                      context, '/cadastroEndereco');
                                }
                              },
                              child: Text('Seguinte'),
                            ),
                          ],
                        ),
                      ))),
                    ),
                  ));
                }))));
  }
}
