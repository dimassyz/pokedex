import 'package:flutter/material.dart';
import 'model/pokemon.dart';
import 'shared/widget/card_pokemon.dart';

class DetailPage extends StatelessWidget {
  
  final Pokemon pokemon;
  const DetailPage({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    String formattedId = pokemon.id.toString().padLeft(3, '0');

    return Scaffold(
      backgroundColor: Colors.white, // Background putih bersih
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Column(
        children: [
          Text(
            pokemon.name,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 22
            ),
          ),
          Text(
            formattedId,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16
            ),
          )
        ],
      )
      ),
      
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: CardPokemonWidget(
                id: pokemon.id, 
                imageUrl: pokemon.imageUrl, 
                name: pokemon.name, 
                type: pokemon.type,
                onTap: null,
                showInfo: false,
                ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.only(top: 30),
                child: Column(
                  children: [
                    Text("Fitur lainnya coming soon")
                  ],
                ),
              )
              )
          ],
        ),
      
      ),
      
    );
  }
}