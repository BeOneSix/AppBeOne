import 'package:beone_app/PerfilSearch/ProfileUI1.dart';
import 'package:flutter/material.dart';

class Perfil1 extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ProfileUI1(), // calling  profilepage Ui design
    );
  }
}
