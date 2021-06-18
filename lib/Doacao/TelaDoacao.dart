import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TelaDoacao extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TelaDoacaoState();
  }
}

class _TelaDoacaoState extends State<TelaDoacao> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blueGrey),
        home: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                'BeOne',
              ),
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
                    child: Center(
                      child: Column(children: [
                        Container(
                            padding: EdgeInsets.all(16),
                            child: Text('Escolha um valor a ser doado:')),
                        Container(
                          width: 100,
                          child: ElevatedButton(
                            onPressed: () {
                              _launchURL("https://mpago.la/1gQXx2r");
                            },
                            child: Text(
                              'R\$10,00',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.green.shade300),
                            ),
                          ),
                        ),
                        Container(
                          width: 100,
                          child: ElevatedButton(
                            onPressed: () {
                              _launchURL("https://mpago.la/2t5TVTj");
                            },
                            child: Text(
                              'R\$20,00',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.yellow.shade300)),
                          ),
                        ),
                        Container(
                          width: 100,
                          child: ElevatedButton(
                            onPressed: () {
                              _launchURL("https://mpago.la/2yGUTZy");
                            },
                            child: Text(
                              'R\$50,00',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.orange.shade300)),
                          ),
                        ),
                        Container(
                          width: 100,
                          child: ElevatedButton(
                            onPressed: () {
                              _launchURL("https://mpago.la/144Ev6G");
                            },
                            child: Text(
                              'R\$100,00',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.red.shade300)),
                          ),
                        ),
                      ]),
                    ),
                  ));
                }))));
  }

  _launchURL(var url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {}
  }
}
