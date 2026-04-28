import 'package:flutter/material.dart';
import 'package:mon_cour_de_flutter/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Parametres")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<ThemeProvider>(
          builder: (context, themeProvider, child) {
            return SwitchListTile(
              title: const Text("Mode sombre"),
              value: themeProvider.isDarkMode,
              onChanged: (value) {
                themeProvider.toggleTheme();
              },
            );
          },
        ),
      ),
    );
  }
}

