import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatelessWidget {
  final String imageUrl;
  final double size;
  final String name;
  final String calories;
  final int borderColorChoice;

  CustomCircleAvatar({
    required this.imageUrl,
    this.size = 100.0,
    required this.name,
    required this.calories,
    this.borderColorChoice = 1, // Valor predeterminado dorado (1)
  });

  Color getBorderColor() {
    if (borderColorChoice == 1) {
      return const Color.fromARGB(255, 255, 215, 0); // Dorado
    } else if (borderColorChoice == 2) {
      return const Color.fromARGB(255, 192, 192, 192); // Plateado
    } else if (borderColorChoice == 3) {
      return const Color.fromARGB(255, 191, 137, 112); // Bronce
    } else {
      return Colors.black; // Otra opción (puedes cambiar esto)
    }
  }

  @override
  Widget build(BuildContext context) {
    final borderColor = getBorderColor();

    return Column(
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: borderColor,
              width: 4.0,
            ),
          ),
          child: CircleAvatar(
            backgroundImage: NetworkImage(imageUrl),
            radius: size / 2,
          ),
        ),
        const SizedBox(height: 8.0), // Espacio entre la imagen y el nombre
        Text(
          name,
          style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 255, 255, 255)),
        ),
        Text(
          calories,
          style: const TextStyle(
              fontSize: 14.0, color: Color.fromARGB(255, 171, 171, 197)),
        ),
      ],
    );
  }
}
