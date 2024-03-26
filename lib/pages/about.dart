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
            Expanded(child: Image(image: AssetImage('images/cat1.jpg'))),
            Expanded(child: Image(image: AssetImage('images/cat2.jpg'))),
            Expanded(child: Image(image: AssetImage('images/cat3.jpg'))),
            Expanded(child: Image(image: AssetImage('images/cat4.jpg'))),
            Expanded(child: Image(image: AssetImage('images/cat5.jpg'))),
            Expanded(child: Image(image: AssetImage('images/cat6.jpg'))),
          ],
        ),

    );
  }
}
