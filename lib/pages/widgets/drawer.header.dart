import 'package:flutter/material.dart';
class MyDrawerHeader extends StatelessWidget {
  const MyDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(child: Row(
      children: [
        Image(
          image: AssetImage('images/emsi_logo1.png'),
          height: 200.0,
          width: 200.0,

          fit: BoxFit.contain,
        ),



      ],
    ),
      decoration: BoxDecoration(

          color: Color(0xFF258754)
      ),
    );
  }
}
