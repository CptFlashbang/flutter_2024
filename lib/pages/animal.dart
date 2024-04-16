import 'package:flutter/material.dart';
import "package:flutter_2024/pet.dart";

class AnimalPage extends StatefulWidget {
  const  AnimalPage({Key? key}) : super(key: key);
  static Route<dynamic> route() => MaterialPageRoute(
    builder: (context) => const AnimalPage(),
  );
  @override
  _AnimalPageState createState() => _AnimalPageState();
}

class _AnimalPageState extends State<AnimalPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animal"),
      ),
            body: ListView(
          children: pets.map((petdetail) {
            return ListTile(
              title: Text(petdetail.animalName),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => PetDetails(
                    petdetail: petdetail,
                  ),
                ),
              ),
            );
          }).toList(),
        )

    );
  }
}
