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
      
    );
  }
}