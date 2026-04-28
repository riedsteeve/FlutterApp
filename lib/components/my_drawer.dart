import 'package:flutter/material.dart';
import 'package:mon_cour_de_flutter/pages/home_page.dart';
import 'package:mon_cour_de_flutter/pages/settings.dart';
import 'package:mon_cour_de_flutter/pages/todo_controllers.dart';
import 'my_drawer_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: [
              MyDrawerTile(
                title: 'Accueil',
                icons: Icons.home,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
              ),
              MyDrawerTile(
                title: 'Mes Tâches',
                icons: Icons.list,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const TodoPage()),
                  );
                },
              ),
              MyDrawerTile(
                title: 'Paramètres',
                icons: Icons.settings,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const Settings()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}