import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ExamesPage extends StatefulWidget {
  const ExamesPage({super.key});

  @override
  State<ExamesPage> createState() => _ExamesPageState();
}

class _ExamesPageState extends State<ExamesPage> {
  List<dynamic> exames = [];

  @override
  void initState() {
    super.initState();
    http.get(Uri.parse("http://192.168.11.101:9000/exames")).then((resp) {
      setState(() {
        exames = json.decode(resp.body);
      });
    }).catchError((err) {
      print("**************Error**********");
      print(err);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF258754),
        title: const Text(
          "Exames Page",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          // Header Row
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: const [
                Expanded(
                  flex: 2,
                  child: Text(
                    "Nom",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "Coeffi...",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "Durée",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    textAlign: TextAlign.center,
                    "Date",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          // ListView.builder for the data rows
          Expanded(
            child: ListView.builder(
              itemCount: exames.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      // Nom column
                      Expanded(
                        flex: 2,
                        child: Text(
                          "${exames[index]["nom"]}",
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 20),
                        ),
                      ),
                      // Coefficients column
                      Expanded(
                        flex: 1,
                        child: Text(
                          "${exames[index]["coefficients"]}",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 20),
                        ),
                      ),
                      // Durée column
                      Expanded(
                        flex: 1,
                        child: Text(
                          "${exames[index]["dure"]}",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 20),
                        ),
                      ),
                      // Date column
                      Expanded(
                        flex: 1,
                        child: Text(
                          "${exames[index]["date"]}",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          // Footer text
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
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
