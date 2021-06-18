import 'package:beone_app/perfil/ProfileUI2.dart';
import 'package:flutter/material.dart';

class Perfil extends StatelessWidget {
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
      home: ProfileUI2(), // calling  profilepage Ui design
    );
  }
}
