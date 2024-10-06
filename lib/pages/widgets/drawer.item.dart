import 'package:flutter/material.dart';
class MyDrawerItem extends StatelessWidget {
  String title;
  Icon itemIcon;
  Function onTap;
  MyDrawerItem({Key? key,
    required this.title,
    required this.itemIcon,
    required this.onTap,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ListTile(

      leading: itemIcon,
      trailing: Icon(Icons.arrow_forward_ios_sharp),
      onTap:()=> onTap,
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
