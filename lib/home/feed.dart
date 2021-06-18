import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [itemPost()],
        ),
      ),
    );
  }

  Widget itemPost() {
    return Column(
      children: [
        // cabeçalho
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              // foto de perfil
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    width: 3,
                    color: Colors.black,
                  ),
                  color: Colors.black,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.network(
                    'https://yt3.ggpht.com/a-/AOh14GiDIH9wkyHVNLw-r-FLjSxix1HHyAK5a34-95Ag4Q=s88-c-k-c0xffffffff-no-rj-mo',
                    width: 45,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Lucas Firmino',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('Betim, MG'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        // imagem do post
        Image.network(
          'https://png.pngtree.com/png-clipart/20190520/original/pngtree-social-media-background-icons-instagram-emoji-emojis-post-template-png-image_4138570.jpg',
          width: MediaQuery.of(context).size.width,
          height: 300,
          fit: BoxFit.cover,
        ),
        // rodapé
        Row(
          children: [
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 0.0, vertical: 8),
                child: Image.asset(
                  'assets/images/heart.png',
                  width: 30,
                )),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Image.asset(
                  'assets/images/batepapo.png',
                  width: 45,
                )),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Image.asset(
                  'assets/images/message.png',
                  width: 30,
                )),
            Spacer(),
          ],
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Lucas Firmino',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: ' Texto da minha potagem',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
