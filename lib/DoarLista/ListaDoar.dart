import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ListaDoar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListaDoarState();
  }
}

String data = '14/06/2021';

class _ListaDoarState extends State<ListaDoar> {
  List<String> _doacao = ['Doações'];

  var maskDoar = new MaskTextInputFormatter(
      mask: 'R\$##,##', filter: {"#": RegExp(r'[0-9]')});
  var textDoar = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blueGrey),
        home: Scaffold(
            body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: LayoutBuilder(builder: (BuildContext context1,
                    BoxConstraints viewportConstraints) {
                  return SingleChildScrollView(
                      child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: viewportConstraints.maxHeight,
                    ),
                    child: Center(
                      child: Column(children: [
                        TextFormField(
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                labelText: "Insira um valor",
                                labelStyle: TextStyle(
                                    fontSize: 15, color: Colors.black),
                                hintText: "Insira um valor"),
                            controller: textDoar,
                            inputFormatters: [maskDoar],
                            validator: (doar) {
                              if (doar == '') {
                                return 'Insira um valor válido';
                              } else if (textDoar.text == 'R\$0,00' ||
                                  textDoar.text == 'R\$00,00' ||
                                  textDoar.text == 'R\$000,00') {
                                return 'Você deve doar pelo menos R\$1';
                              }
                            }),
                        Container(
                            margin: EdgeInsets.all(10.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _doacao.add('Doação de: ' +
                                        textDoar.text +
                                        '\nData: ' +
                                        '$data');
                                  });
                                },
                                child: Text('Doar'))),
                        Column(
                            children: _doacao
                                .map((element) => Card(
                                      child: Column(
                                        children: <Widget>[
                                          Image.asset(
                                              'https://image.freepik.com/vetores-gratis/cofrinho-com-moedas-simbolo-de-porco-classico-em-ceramica-de-poupar-dinheiro_87543-3317.jpg'),
                                          Text(element,
                                              style: TextStyle(
                                                  color: Colors.deepPurple))
                                        ],
                                      ),
                                    ))
                                .toList()),
                      ]),
                    ),
                  ));
                }))));
  }
}
