import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  static final PreferenciasUsuario _instancia =
      new PreferenciasUsuario._internal();
  factory PreferenciasUsuario() {
    return _instancia;
  }
  PreferenciasUsuario._internal();

  late SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  //bool? _colorSecundario;
  //int? _genero;
  //String? _nombre;

  int get genero {
    return this._prefs.getInt('genero') ?? 1;
  }

  set genero(int value) {
    this._prefs.setInt('genero', value);
  }

  bool get colorSecundario {
    return this._prefs.getBool('colorSecundario') ?? false;
  }

  set colorSecundario(bool value) {
    this._prefs.setBool('colorSecundario', value);
  }

  String get nombreUsuario {
    return this._prefs.getString('nombre') ?? '';
  }

  set nombreUsuario(String value) {
    this._prefs.setString('nombre', value);
  }

  String get ultimaPagina {
    return this._prefs.getString('ultimaPagina') ?? 'home';
  }

  set ultimaPagina(String value) {
    this._prefs.setString('ultimaPagina', value);
  }
}
