import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/Commons/Custom_Drawer/custom_drawer.dart';
import 'package:flutter_ecommerce/generated/l10n.dart';
import 'package:flutter_ecommerce/model/user_model.dart';
import 'package:flutter_ecommerce/services/authtenticador-service.dart';
import 'package:provider/provider.dart';

import '../../model/Manager/config_manager.dart';

class ConfigScreen extends StatefulWidget {
  @override
  State<ConfigScreen> createState() => _ConfigScreenState();
}

class _ConfigScreenState extends State<ConfigScreen> {
  saveConfg(context) async {
    if (Provider.of<UserManager>(context, listen: false).isLoggedIn) {
      UserService().setThemeConfigUser(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(title: Text(LocaleProvider.of(context).settings)),
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
            child: Consumer<ThemeAppConfig>(
              builder: (_, themeAppConfig, __) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(width: 10),
                    Expanded(
                        flex: 4,
                        child: Text(
                          LocaleProvider.of(context).dark_mode,
                          style: TextStyle(fontSize: 16),
                        )),
                    Expanded(
                        flex: 1,
                        child: Switch(
                            value: themeAppConfig.getTheme,
                            onChanged: (value) {
                              setState(() {
                                themeAppConfig.setThemeAppConfig = value;
                                saveConfg(context);
                              });
                            })),
                  ],
                );
              },
            ),
          ),
          Consumer<ThemeAppConfig>(builder: (_, themeAppConfig, __) {
            String _changeValue = '';
            _changeValue = themeAppConfig.getLocale == Locale('pt', 'BR')
                ? LocaleProvider.of(context).portuguese
                : LocaleProvider.of(context).english;
            return Container(
              margin: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: DropdownButton(
                        items: [
                          LocaleProvider.of(context).portuguese,
                          LocaleProvider.of(context).english
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        value: _changeValue,
                        hint: Text(
                          LocaleProvider.of(context).change_lenguage,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        onChanged: (_changeValue) {
                          setState(() {
                            if (_changeValue ==
                                LocaleProvider.of(context).portuguese) {
                              Provider.of<ThemeAppConfig>(context,
                                      listen: false)
                                  .setLocaleConfig = const Locale('pt', 'BR');
                            } else {
                              Provider.of<ThemeAppConfig>(context,
                                      listen: false)
                                  .setLocaleConfig = const Locale('en', 'US');
                            }
                            saveConfg(context);
                          });
                        }),
                  ),
                  Text(
                    ' ${_changeValue}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            );
          })
        ])),
      ),
    );
  }
}
