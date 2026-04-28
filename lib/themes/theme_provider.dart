import 'package:flutter/material.dart';
import 'package:mon_cour_de_flutter/themes/dark_mode.dart';
import 'package:mon_cour_de_flutter/themes/light_mode.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  //Theme par defaut

  ThemeData _themeData = lightMode;

  //Charger le theme au démarrage
  ThemeProvider(){
    _loadTheme();
  } 

  //Getter du theme actif
  ThemeData get themeData => _themeData;

  //Getter pour vérifier si le mode sombre est activé
  bool get isDarkMode => _themeData == darkMode;

  //Setter(Avec le notification UI)
  set themeData(ThemeData themeData){
    _themeData = themeData;
    notifyListeners();
  }



  //Fonction qui met en lighMode si c'est en darkMode et inversemnt
  Future<void> toggleTheme() async{
    final sharedPreferences = await SharedPreferences.getInstance();

    if(_themeData == lightMode){
      _themeData = darkMode;
      sharedPreferences.setBool('isDark', true);
    }else{
      _themeData = lightMode;
      sharedPreferences.setBool('isDark', false);
    }
    notifyListeners();
  } 

  //Méthode ppour charger le theme au démarrage
  Future<void> _loadTheme() async{
    final sharedPreferences = await SharedPreferences.getInstance();
    final isDark = sharedPreferences.getBool('isDark') ?? false;

    
    notifyListeners();
  }
}