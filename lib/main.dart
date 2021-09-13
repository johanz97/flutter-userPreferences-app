import 'package:flutter/material.dart';
import 'package:preferencias_usuario/pages/home_page.dart';
import 'package:preferencias_usuario/pages/settings_page.dart';
import 'package:preferencias_usuario/shell_prefs/prefs_usuario.dart';

void main() async {
  //Inicializa los widgets
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final prefs = new PreferenciasUsuario();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Preferencias',
        initialRoute: prefs.ultimaPagina,
        routes: {
          HomePage.routeName: (_) => HomePage(),
          SettingsPage.routeName: (_) => SettingsPage(),
        });
  }
}
