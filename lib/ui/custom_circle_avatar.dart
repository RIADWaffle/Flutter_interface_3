import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatelessWidget {
  final String imageUrl;
  final Color borderColor;
  final double size;
  final String name;
  final String numbers;

  CustomCircleAvatar({
    required this.imageUrl,
    required this.borderColor,
    this.size = 100.0,
    required this.name,
    required this.numbers,
  });

  @override
  Widget build(BuildContext context) {
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
          numbers,
          style: const TextStyle(
              fontSize: 14.0, color: Color.fromARGB(255, 171, 171, 197)),
        ),
      ],
    );
  }
}
