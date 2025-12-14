import 'package:flutter/material.dart';
import '../shared/widget/card_pokemon.dart';
import '../model/dummy_data.dart';
import 'detail_page.dart';

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
          mainAxisSpacing: 10,
          childAspectRatio: 0.67,
        ),
        itemCount: dummyPokemonList.length,
        itemBuilder: (context, index) {
          return CardPokemonWidget(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(pokemon: dummyPokemonList[index]),
                ),
              );
            }, 
            imageUrl: dummyPokemonList[index].imageUrl,
            name: dummyPokemonList[index].name,
            id: dummyPokemonList[index].id,
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
          "Pokédex",
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text(
          "Search for a Pokémon by name or using its National Pokédex number.",
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
              hintText: "Name or number",
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
