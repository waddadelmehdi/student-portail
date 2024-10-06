import 'dart:convert';
import 'package:emsi_portail/pages/widgets/drawer.widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> events = [];

  @override
  void initState() {
    super.initState();
    http
        .get(Uri.parse("http://192.168.11.101:9000/events"))
        .then((resp) => {
      setState(() {
        events = json.decode(resp.body);
      })
    })
        .catchError((err) {
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
          "Home Page",
          style: TextStyle(color: Colors.white),
        ),
      ),
      drawer: const MyDrawer(),
      body: Column(
        children: [
          // Expanded widget to allow the ListView to take available space
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            height: 190,
                            width: 190,
                            child: Card(
                              child: Column(
                                children: [
                                  Text(
                                    "${events[index]["nom"]}",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                  Text(
                                    "${events[index]["description"]}",
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 8),
                                  ),
                                  Text(
                                    "${events[index]["date pub"]}",
                                    style: const TextStyle(
                                        color: Colors.grey, fontSize: 8),
                                    textAlign: TextAlign.end,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Image(
                            width: 230,
                            height: 200,
                            image: AssetImage("${events[index]['image']}"),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: events.length,
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
