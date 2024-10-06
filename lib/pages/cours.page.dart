import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CoursPage extends StatefulWidget {
  const CoursPage({super.key});

  @override
  State<CoursPage> createState() => _CoursPageState();
}

class _CoursPageState extends State<CoursPage> {
  List<dynamic> cours = [];

  @override
  void initState() {
    super.initState();
    http.get(Uri.parse("http://192.168.11.101:9000/cours")).then((resp) {
      setState(() {
        cours = json.decode(resp.body);
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
          "Cours Page",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          // Header Row
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
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
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    "Module",
                    textAlign: TextAlign.center,
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
              itemCount: cours.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      // Name column
                      Expanded(
                        flex: 2,
                        child: Text(
                          "${cours[index]["nom"]}",
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
                          "${cours[index]["coefficients"]}",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 20),
                        ),
                      ),
                      // Module column
                      Expanded(
                        flex: 2,
                        child: Text(
                          "${cours[index]["module"]}",
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
