import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);
  static Route<dynamic> route() => MaterialPageRoute(
        builder: (context) => const AboutPage(),
      );
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About"),
      ),
       body: ListView(
            padding: const EdgeInsets.all(8),
            children: <Widget>[
            Container(
              height: 200,
              color: const Color.fromARGB(255, 18, 45, 200),
              child: const Image(image: AssetImage('images/cat1.jpg')),
            ),
            Container(
              height: 200,
              color: Color.fromARGB(255, 200, 18, 18),
              child: const Image(image: AssetImage('images/cat2.jpg')),
            ),
            Container(
              height: 200,
              color: Color.fromARGB(255, 255, 102, 0),
              child: const Image(image: AssetImage('images/cat3.jpg')),
            ),
            Container(
              height: 200,
              color: Color.fromARGB(255, 255, 251, 0),
              child: const Image(image: AssetImage('images/cat4.jpg')),
            ),
            Container(
              height: 200,
              color: Color.fromARGB(255, 21, 255, 0),
              child: const Image(image: AssetImage('images/cat5.jpg')),
            ),
            Container(
              height: 200,
              color: Color.fromARGB(255, 0, 195, 255),
              child: const Image(image: AssetImage('images/cat6.jpg')),
            ),
          ],
        ),

    );
  }
}
