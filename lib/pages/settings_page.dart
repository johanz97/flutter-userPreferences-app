import 'package:flutter/material.dart';
import 'package:preferencias_usuario/shell_prefs/prefs_usuario.dart';
import 'package:preferencias_usuario/widgets/drawer.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late bool _colorSecundario;
  late int _genero;
  late TextEditingController _controllerText;
  final prefs = new PreferenciasUsuario();

  @override
  void initState() {
    super.initState();
    prefs.ultimaPagina = SettingsPage.routeName;
    _genero = prefs.genero;
    _colorSecundario = prefs.colorSecundario;
    _controllerText = new TextEditingController(text: prefs.nombreUsuario);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
        backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.blue,
      ),
      drawer: MenuDrawer(),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text(
              'Settings',
              style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),
            ),
          ),
          Divider(),
          SwitchListTile(
            value: _colorSecundario,
            title: Text('Color Secundario'),
            onChanged: _setSelectedColor,
          ),
          RadioListTile(
            value: 1,
            title: Text('Masculino'),
            groupValue: _genero,
            onChanged: _setSelectedRadio,
          ),
          RadioListTile(
            value: 2,
            title: Text('Femenino'),
            groupValue: _genero,
            onChanged: _setSelectedRadio,
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _controllerText,
              decoration: InputDecoration(
                  labelText: 'Nombre',
                  helperText: 'Nombre dela persona usando el celular'),
              onChanged: (value) {
                prefs.nombreUsuario = value;
              },
            ),
          )
        ],
      ),
    );
  }

  //Seleccion del genero
  _setSelectedRadio(int? value) async {
    prefs.genero = value ?? 1;
    _genero = value ?? 1;
    setState(() {});
  }

  //Activar color secundario
  _setSelectedColor(bool? value) async {
    prefs.colorSecundario = value ?? false;
    _colorSecundario = value ?? false;
    setState(() {});
  }
}
