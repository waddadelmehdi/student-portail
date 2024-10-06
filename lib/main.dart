import 'package:emsi_portail/pages/controlpage.dart';
import 'package:emsi_portail/pages/cours.page.dart';
import 'package:emsi_portail/pages/emploiPage.dart';
import 'package:emsi_portail/pages/exames.page.dart';
import 'package:emsi_portail/pages/home.page.dart';
import 'package:emsi_portail/splashscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(EmsiPortail());
}

class EmsiPortail extends StatelessWidget {
  const EmsiPortail({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "":(context)=>HomePage(),
        "/cours":(context)=>CoursPage(),
        "/exames":(context)=>ExamesPage(),
        "/calendar":(context)=>EmploiPage(),
        "/planning-control":(context)=>ControlePage(),

      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

          primarySwatch: Colors.cyan,
          textTheme: TextTheme(
            bodyMedium: TextStyle(fontSize: 25,color: Color(0xFF258754)),
            bodyLarge: TextStyle(fontSize: 32,color: Color(0xFF258754)),
            bodySmall: TextStyle(fontSize: 18,color: Color(0xFF258754))

          ),
        iconTheme: IconThemeData(color:Color(0xFF258754),size: 26 ),

      ),
      home : Splashscreen(),
      


    );
  }
}


