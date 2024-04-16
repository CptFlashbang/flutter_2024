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

class PetDetails extends StatelessWidget {
  final Pet petdetail;
  const PetDetails({super.key, required this.petdetail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(petdetail.animalName),
        ),
        body: Column(children: [
          Image.asset(petdetail.animalPic),
          Text("Name: ${petdetail.animalName}"),
          Text("Age: ${petdetail.animalAge}"),
          Text("Type: ${petdetail.animalType}"),
          Text("Breed: ${petdetail.animalBreed}"),
        ]));
  }
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
