import 'package:beone_app/DoarLista/ListaDoar.dart';
import 'package:beone_app/PerfilSearch/Perfil.dart';
import 'package:beone_app/PerfilSearch/Search.dart';
import 'package:beone_app/home/feed.dart';
import 'package:beone_app/perfil/perfil.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:beone_app/TelaAmigos/TelaAmigos.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  int indice = 0;
  final List<Widget> rotas = [
    PrimeiraRota(),
    SegundaRota(),
    TerceiraRota(),
    QuartaRota(),
    QuintaRota(),
    SextaRota(),
  ];
  aoPressionar(int rotaSelecionada) {
    setState(
      () {
        this.indice = rotaSelecionada;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text(('BeOne')),
        ),
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                ),
                child: Text('Administrador'),
              ),
              ListTile(
                title: Text('Conexões'),
                onTap: () {
                  int rotaAmigos = 3;
                  aoPressionar(rotaAmigos);
                },
              ),
              ListTile(
                title: Text('Histórico de doações'),
                onTap: () {
                  int rotaAmigos = 4;
                  aoPressionar(rotaAmigos);
                },
              ),
            ],
          ),
        ),
        body: rotas[this.indice],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined),
              label: 'Buscar',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              label: 'Perfil',
            ),
          ],
          onTap: (int pageTapped) {
            aoPressionar(pageTapped);
          },
        ),
      ),
    );
  }
}

class PrimeiraRota extends StatefulWidget {
  @override
  PrimeiraRotaState createState() => PrimeiraRotaState();
}

class PrimeiraRotaState extends State<PrimeiraRota> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Feed());
  }
}

class SegundaRota extends StatefulWidget {
  @override
  SegundaRotaState createState() => SegundaRotaState();
}

class SegundaRotaState extends State<SegundaRota> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Search());
  }
}

class TerceiraRota extends StatefulWidget {
  @override
  TerceiraRotaState createState() => TerceiraRotaState();
}

class TerceiraRotaState extends State<TerceiraRota> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Perfil(),
    );
  }
}

class QuartaRota extends StatefulWidget {
  @override
  _QuartaRotaState createState() => _QuartaRotaState();
}

class _QuartaRotaState extends State<QuartaRota> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TelaAmigos(),
    );
  }
}

class QuintaRota extends StatefulWidget {
  @override
  _QuintaRotaState createState() => _QuintaRotaState();
}

class _QuintaRotaState extends State<QuintaRota> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListaDoar(),
    );
  }
}

class SextaRota extends StatefulWidget {
  @override
  _SextaRotaState createState() => _SextaRotaState();
}

class _SextaRotaState extends State<SextaRota> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Perfil1(),
    );
  }
}

Widget titleBar() {
  return AppBar(
    elevation: 1,
    title: Text(
      'BeOne',
      style: GoogleFonts.notoSans(color: Colors.white, fontSize: 28),
    ),
    centerTitle: true,
    backgroundColor: Colors.blueGrey,
    leading: Icon(
      Icons.photo_camera_outlined,
      color: Colors.white,
    ),
  );
}
