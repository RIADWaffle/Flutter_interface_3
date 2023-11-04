import 'package:flutter/material.dart';

class CustomShopCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String price;

  CustomShopCard({
    required this.imageUrl,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 36, 37, 38),
      elevation: 4, // Elevación de la tarjeta
      margin: const EdgeInsets.all(20), // Márgenes
      child: Column(
        children: <Widget>[
          Image.network(
            imageUrl, // URL de la imagen
            fit: BoxFit.cover, // Ajuste de la imagen
            height: 150,
            width: 150, // Altura de la imagen
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              name, // Nombre
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Text(
            price, // Calorías
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
