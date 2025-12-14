import 'package:flutter/material.dart';

class CardPokemonWidget extends StatelessWidget {
  final int id;
  final String imageUrl;
  final String name;
  final String type;
  final VoidCallback? onTap;
  final bool showInfo;

  const CardPokemonWidget({
    super.key,
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.type,
    this.onTap,
    this.showInfo = true,
  });
  @override
  Widget build(BuildContext context) {
    String formattedId = id.toString().padLeft(3, '0');

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
            SizedBox(height: 10,),
            Image.network(imageUrl, width: double.infinity, fit: BoxFit.fill),

             if (showInfo) ...[
              SizedBox(height: 10),
              Text(
                name,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                formattedId,
                style: TextStyle(fontSize: 12, color: Colors.grey[700]),
              ),
              SizedBox(height: 10),
            ],

            if (!showInfo) SizedBox(height: 20),
            ],
        ),
      ),
    );
  }
}
