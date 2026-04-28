import 'package:flutter/material.dart';

/*
MON DRAWER TILE


Une tuile clicqable pour chaque élément du menu drawer

----------------------

Chaque tilt contioen :
  un titre
  une icone
  une action / fonction
*/

class MyDrawerTile extends StatelessWidget{
  //Déclaration des attributs
  final String title;
  final IconData icons;
  final  void Function()? onTap;

  const MyDrawerTile({super.key,
  required this.title,
  required this.icons,
  required this.onTap,
  
  });




  //UI
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: Icon(icons),
      onTap: onTap,
    );
  }
}

