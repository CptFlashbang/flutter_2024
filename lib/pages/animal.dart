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
   var isLargeScreen = false;
  Pet savedPet = pets[0];

  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
        appBar: AppBar(
          title: const Text("Animal"),
        ),
        body: OrientationBuilder(builder: (context, orientation) {
          if (MediaQuery.of(context).size.width > 800) {
            isLargeScreen = true;
          } else {
            isLargeScreen = false;
          }
          return Row(children: <Widget>[
            Expanded(
              child: ListWidget(pets, (value) {
                if (isLargeScreen) {
                  savedPet = pets[value];
                  setState(() {});
                } else {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return PetDetails(petdetail: pets[value]);
                  }));
                }
              }),
            ),
            isLargeScreen
                ? Expanded(flex: 2, child: DetailWidget(petdetail: savedPet))
                : Container()
          ]);
        }));
  }
}

