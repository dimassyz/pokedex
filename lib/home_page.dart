import 'package:flutter/material.dart';
import '../shared/widget/card_pokemon.dart';
import '../model/dummy_data.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final TextEditingController searchName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              headerBar(),
              SizedBox(height: 20),
              searchBar(searchName),
              SizedBox(height: 20),
              listPokemon(),
            ],
          ),
        ),
      ),
    );
  }

  Widget listPokemon() {
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 8,
          childAspectRatio: 3 / 4,
        ),
        itemCount: dummyPokemonList.length,
        itemBuilder: (context, index) {
          return CardPokemonWidget(
            onTap: () {
              print('Tapped on ${dummyPokemonList[index].name}');
            },
            imageUrl: dummyPokemonList[index].imageUrl,
            name: dummyPokemonList[index].name,
            type: dummyPokemonList[index].type,
          );
        },
      ),
    );
  }

  Widget headerBar() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Pokedex",
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text(
          "Search for any pokemon you want",
          style: TextStyle(color: Colors.grey[700], fontSize: 20),
        ),
      ],
    );
  }

  Widget searchBar(TextEditingController searchName) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: searchName,
            decoration: InputDecoration(
              hintText: "Search Pokemon",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey),
              ),
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 10),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(Icons.filter_list),
        ),
      ],
    );
  }
}
