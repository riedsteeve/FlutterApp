import 'package:flutter/material.dart';
import 'package:mon_cour_de_flutter/components/my_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Accueil")),
      drawer: MyDrawer(),
      body: Text("Bienvenu sur Cookshare"),
    );
  }
}