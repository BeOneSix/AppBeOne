import 'dart:convert';

import 'package:beone_app/chat/chat.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TelaAmigos extends StatefulWidget {
  const TelaAmigos({Key? key}) : super(key: key);

  @override
  _TelaAmigosState createState() => _TelaAmigosState();
}

class _TelaAmigosState extends State<TelaAmigos> {
  List users = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    this.fetchUser();
  }

  fetchUser() async {
    setState(() {
      isLoading = true;
    });
    var url = "https://randomuser.me/api/?results=10";
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var items = json.decode(response.body)['results'];
      setState(() {
        users = items;
        isLoading = false;
      });
    } else {
      setState(() {
        users = [];
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, main) {
            return getCard(users[main]);
          },
        ),
      ),
    );
  }

  Widget getCard(main) {
    var fullName = main['name']['title'] +
        " " +
        main['name']['first'] +
        " " +
        main['name']['last'];

    var email = main['email'];
    var picture = main['picture']['large'];
    return GestureDetector(
      onTap: () => {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Chat()))
      },
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            title: Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(60 / 2),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(picture.toString()),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      fullName.toString(),
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      email.toString(),
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
