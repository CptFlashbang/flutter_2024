import 'package:flutter/material.dart';
import "package:flutter_2024/pet.dart";
typedef Null ItemSelectedCallback(int value);

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

class ListWidget extends StatefulWidget {
  final List<Pet> pets;
  final ItemSelectedCallback onItemSelected;
  const ListWidget(this.pets, this.onItemSelected, {super.key});
  @override
  _ListWidgetState createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.pets.length,
      itemBuilder: (context, position) {
        return Padding(
          padding: const EdgeInsets.all(2.0),
          child: Card(
            child: InkWell(
              onTap: () {
                widget.onItemSelected(position);
              },
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      widget.pets[position].animalName,
                      style: const TextStyle(fontSize: 16.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
