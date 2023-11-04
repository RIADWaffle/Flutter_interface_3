import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final String name;
  final String message;
  final String img;

  ChatMessage({
    required this.name,
    required this.message,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 36, 37, 38), // Fondo de color
        borderRadius: BorderRadius.circular(8), // Borde redondeado
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.blue,
            backgroundImage: NetworkImage(img),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Color de texto blanco
                ),
              ),
              Container(
                width: 200,
                child: Text(
                  message,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white, // Color de texto blanco
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
