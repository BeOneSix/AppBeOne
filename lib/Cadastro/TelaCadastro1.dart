import 'package:flutter/material.dart';

class Cadastro1 extends StatefulWidget {
  @override
  _Cadastro1State createState() => _Cadastro1State();
}

class _Cadastro1State extends State<Cadastro1> {
  final List<String> contaTipo = ['Selecione', 'CPF', 'CNPJ'];
  var currentAccountType;
  String erro = '';
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
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            DropdownButtonFormField(
                              value: contaTipo[0],
                              items: contaTipo.map((accountType) {
                                return DropdownMenuItem(
                                  value: accountType,
                                  child: Text(accountType),
                                );
                              }).toList(),
                              onChanged: (val) {
                                setState(() {
                                  currentAccountType = val;
                                });
                              },
                            ),
                            Text('$erro'),
                            ElevatedButton(
                              onPressed: () {
                                if (currentAccountType != 'Selecione' &&
                                    currentAccountType != null) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text('Processing Data')));
                                  Navigator.pushNamed(
                                      context, '/cadastro2$currentAccountType');
                                } else {
                                  setState(() {
                                    erro = 'Selecione uma opção válida';
                                  });
                                }
                              },
                              child: Text('Seguinte'),
                            ),
                          ],
                        ),
                      ))),
                    ),
                  );
                }))));
  }
}
