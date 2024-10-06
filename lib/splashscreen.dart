import 'dart:io';

import 'package:emsi_portail/main.dart';
import 'package:emsi_portail/pages/home.page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 2500),()=>Navigator.push(context,MaterialPageRoute(builder: (context)=>HomePage(),),),);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Spacer(),
          Center(
            child: FractionallySizedBox(widthFactor: .6,
              child:
              Image(
                image: AssetImage('images/emsi_logo.png'),
                height: 400.0,
                width: 400.0,

                fit: BoxFit.contain,
              ),

            ),
          ),
          Text("Portail EMSI",
            style: TextStyle(fontSize:30 ),),
          Spacer(),
          CircularProgressIndicator(color: Colors.green,),
          Spacer(),
          Text("Bienvenue à EMSI",
          style:TextStyle( ),)
        ],
      ),
    ),
    );
  }
}

