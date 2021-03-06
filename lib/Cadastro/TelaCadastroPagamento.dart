import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CadastroPagamento extends StatefulWidget {
  @override
  _CadastroStatePagamento createState() {
    return _CadastroStatePagamento();
  }
}

class _CadastroStatePagamento extends State<CadastroPagamento> {
  final _formKey = GlobalKey<FormState>();
  var textData = TextEditingController();
  var maskData = new MaskTextInputFormatter(
      mask: '##/##', filter: {"#": RegExp(r'[0-9]')});
  var textCardNum = TextEditingController();
  var maskCardNum = new MaskTextInputFormatter(
      mask: '####-####-####-####', filter: {'#': RegExp(r'[0-9]')});
  var textNumVerif;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
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
                                  labelText: "N??mero do cart??o",
                                  labelStyle: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                  hintText: "Informe n??mero do cart??o"),
                              validator: (cardNum) {
                                if (cardNum == '') {
                                  return "Informe n??mero do cart??o";
                                }
                                return null;
                              },
                              controller: textCardNum,
                              inputFormatters: [maskCardNum],
                            ),
                            TextFormField(
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                  labelText: "Data validade",
                                  labelStyle: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                  hintText:
                                      "Informe a data e validade do cart??o"),
                              validator: (data) {
                                List<String> resultData =
                                    textData.text.split(new RegExp(r'/+'));
                                if (data == '') {
                                  return "Informe a data de validate";
                                }
                                if (textData.text.length < 5) {
                                  return "Tamanho inv??lido";
                                }
                                if (int.parse(resultData[1]) > 12 ||
                                    int.parse(resultData[1]) < 01 ||
                                    int.parse(resultData[0]) > 31 ||
                                    int.parse(resultData[0]) < 1) {
                                  return 'Data inv??lida';
                                } else {
                                  if (int.parse(resultData[1]) == 02) {
                                    if (int.parse(resultData[2]) % 4 == 0) {
                                      if (int.parse(resultData[0]) > 29) {
                                        return 'Data inv??lida';
                                      }
                                    } else {
                                      if (int.parse(resultData[0]) > 28) {
                                        return 'Data inv??lida';
                                      }
                                    }
                                  }
                                  if (int.parse(resultData[1]) == 04 ||
                                      int.parse(resultData[1]) == 06 ||
                                      int.parse(resultData[1]) == 09 ||
                                      int.parse(resultData[1]) == 11) {
                                    if (int.parse(resultData[0]) > 30) {
                                      return 'Data inv??lida';
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
                                    labelText: "N??mero de verifica????o",
                                    labelStyle: TextStyle(
                                        fontSize: 15, color: Colors.black),
                                    hintText: "Insira o n??mero de verifica????o"),
                                controller: textNumVerif,
                                validator: (numVerif) {
                                  if (numVerif == '') {
                                    return 'Insira o n??mero de verifica????o';
                                  }
                                  return null;
                                }),
                            ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  // If the form is valid, display a snackbar. In the real world,
                                  // you'd often call a server or save the information in a database.
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text('Processing Data')));
                                  Navigator.pushNamed(context, '/login');
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
