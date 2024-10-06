import 'package:flutter/material.dart';

class ControlePage extends StatefulWidget {
  const ControlePage({super.key});

  @override
  State<ControlePage> createState() => _ControlePageState();
}

class _ControlePageState extends State<ControlePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF258754),
        title: const Text(
          'Planning des Contrôles',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 30), // Adds space from the top
          Center(
            child: Text(
              'Calendrier des évaluations',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 100), // Increases the space between the text and the image
          Center(
            child: Image.asset('images/4IIR.png'), // Displays the local image
          ),
          const Spacer(), // Pushes the footer to the bottom
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0), // Adds space at the bottom
            child: Column(
              children: const [
                Text(
                  '© 2025 ÉCOLE MAROCAINE DES SCIENCES DE L\'INGÉNIEUR',
                  style: TextStyle(fontSize: 12, color: Colors.black),
                ),
                Text(
                  'Tous droits réservés.',
                  style: TextStyle(fontSize: 12, color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
