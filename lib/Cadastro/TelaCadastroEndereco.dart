import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CadastroEndereco extends StatefulWidget {
  @override
  _CadastroEndereco createState() => _CadastroEndereco();
}

class _CadastroEndereco extends State<CadastroEndereco> {
  final _formKey = GlobalKey<FormState>();
  var textCep = TextEditingController();
  var textRua = TextEditingController();
  var textBairro = TextEditingController();
  var textCidade = TextEditingController();
  var textEstado = TextEditingController();

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
                                labelText: "CEP",
                                labelStyle: TextStyle(
                                    fontSize: 15, color: Colors.black),
                                hintText: "Informe seu CEP",
                              ),
                              controller: textCep,
                              validator: (cep) {
                                if (cep == '') {
                                  return "Informe um CEP";
                                }
                                return null;
                              },
                              onChanged: (cep) async {
                                String url =
                                    'https://viacep.com.br/ws/$cep/json/';
                                http.Response response;
                                response = await http.get(url);
                                Map<String, dynamic> retorno =
                                    json.decode(response.body);

                                setState(() {
                                  textRua.text = retorno["logradouro"];
                                  textBairro.text = retorno["bairro"];
                                  textCidade.text = retorno["localidade"];
                                  textEstado.text = retorno['uf'];
                                });
                              },
                            ),
                            TextFormField(
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                labelText: "Rua",
                                labelStyle: TextStyle(
                                    fontSize: 15, color: Colors.black),
                                hintText: "Informe sua rua",
                              ),
                              controller: textRua,
                              validator: (rua) {
                                if (rua == '') {
                                  return "Informe uma rua";
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                labelText: "Bairro",
                                labelStyle: TextStyle(
                                    fontSize: 15, color: Colors.black),
                                hintText: "Informe seu bairro",
                              ),
                              controller: textBairro,
                              validator: (bairro) {
                                if (bairro == '') {
                                  return "Informe um bairro";
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                labelText: "Cidade",
                                labelStyle: TextStyle(
                                    fontSize: 15, color: Colors.black),
                                hintText: "Informe sua cidade",
                              ),
                              controller: textCidade,
                              validator: (cidade) {
                                if (cidade == '') {
                                  return "Informe uma cidade";
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                labelText: "Estado",
                                labelStyle: TextStyle(
                                    fontSize: 15, color: Colors.black),
                                hintText: "Informe seu estado",
                              ),
                              controller: textEstado,
                              validator: (estado) {
                                if (estado == '') {
                                  return "Informe um estado";
                                }
                                return null;
                              },
                            ),
                            ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  // If the form is valid, display a snackbar. In the real world,
                                  // you'd often call a server or save the information in a database.
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text('Processing Data')));
                                  Navigator.pushNamed(
                                      context, '/cadastroPagamento');
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
