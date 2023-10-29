import 'package:flutter/material.dart';

ElevatedButton buildElevatedButton(int dynamicNumber, String imageUrl,
    String primaryText, String additionalText, VoidCallback onPressed) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: const Color.fromARGB(255, 36, 37, 38),
      minimumSize: const Size(
          0, 70), // Aumenta la altura para acomodar el texto adicional
    ),
    child: Row(
      children: [
        // Número dinámico a la izquierda
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            dynamicNumber.toString(),
            style: const TextStyle(fontSize: 18),
          ),
        ),
        // Imagen a la derecha del número
        Padding(
          padding: const EdgeInsets.all(10),
          child: CircleAvatar(
            backgroundImage: NetworkImage(imageUrl),
            radius: 32,
          ),
        ),
        // Columna para el texto
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Texto a la derecha de la imagen
              Text(
                primaryText,
                textAlign: TextAlign.center,
              ),
              // Texto adicional debajo del texto principal
              Text(
                additionalText,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
