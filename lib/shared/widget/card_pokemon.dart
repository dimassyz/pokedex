import 'package:flutter/material.dart';

class CardPokemonWidget extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String type;
  final VoidCallback? onTap;
  const CardPokemonWidget({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.type,
    this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: type == 'Fire'
              ? Colors.red[100]
              : type == 'Water'
              ? Colors.blue[100]
              : type == 'Grass'
              ? Colors.green[100]
              : Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Image.network(imageUrl, width: double.infinity, fit: BoxFit.fill),
            SizedBox(height: 10),
            Text(
              name,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(type, style: TextStyle(fontSize: 10, color: Colors.grey[700])),
          ],
        ),
      ),
    );
  }
}
