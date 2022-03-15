import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/Commons/Custom_Drawer/custom_drawer.dart';
import 'package:flutter_ecommerce/model/Manager/config_manager.dart';
import 'package:provider/provider.dart';

class ConfigScreen extends StatefulWidget {
  @override
  State<ConfigScreen> createState() => _ConfigScreenState();
}

class _ConfigScreenState extends State<ConfigScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(title: const Text("Configuração")),
      body: Container(
        margin: const EdgeInsets.all(8.0),
        child: Card(
            child: ListView(children: [
          Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                      width: 0.5, color: Color.fromARGB(255, 34, 31, 31)),
                ),
              ),
              child: Consumer<ThemeApp>(
                builder: (_, themeApp, __) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(width: 10),
                      const Expanded(
                          flex: 4,
                          child: Text(
                            "Modo Escuro",
                            style: TextStyle(fontSize: 16),
                          )),
                      Expanded(
                          flex: 1,
                          child: Switch(
                              value: themeApp.getTheme,
                              onChanged: (value) {
                                setState(() {
                                  Provider.of<ThemeApp>(context, listen: false)
                                      .setThemeApp = value;
                                });
                              })),
                    ],
                  );
                },
              )),
        ])),
      ),
    );
  }
}
