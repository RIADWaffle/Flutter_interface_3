import 'package:flutter/material.dart';

class ProfileCircleAvatar extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String calories;
  final int number;
  final String goal;

  ProfileCircleAvatar({
    required this.imageUrl,
    required this.name,
    required this.calories,
    required this.number,
    required this.goal,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 200,
          height: 200,
          child: CircleAvatar(
            backgroundImage: NetworkImage(imageUrl),
            radius: 50 / 2,
          ),
        ),
        const SizedBox(height: 8.0), // Espacio entre la imagen y el nombre
        Text(
          name,
          style: const TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 255, 255, 255)),
        ),
        const Text(
          "Profesional Athlete",
          style: TextStyle(
              fontSize: 18.0, color: Color.fromARGB(255, 171, 171, 197)),
        ),
        const SizedBox(height: 20.0),

        Row(
          mainAxisAlignment: MainAxisAlignment
              .spaceAround, // Alinea las columnas alrededor del espacio disponible
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment
                    .center, // Centra los elementos verticalmente
                children: [
                  Text(
                    number.toString(),
                    style: const TextStyle(
                      fontSize: 18.0,
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "Position",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Color.fromARGB(255, 171, 171, 197),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16.0), // Espacio entre "number" y "calories"
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment
                    .center, // Centra los elementos verticalmente
                children: [
                  Text(
                    calories,
                    style: const TextStyle(
                      fontSize: 18.0,
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "points",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Color.fromARGB(255, 171, 171, 197),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16.0), // Espacio entre "points" y "goals"
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment
                    .center, // Centra los elementos verticalmente
                children: [
                  Text(
                    goal,
                    style: const TextStyle(
                      fontSize: 18.0,
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "Goal Streaks",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Color.fromARGB(255, 171, 171, 197),
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
