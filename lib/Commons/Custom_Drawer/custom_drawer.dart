import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/Commons/Custom_Drawer/Custom_Drawer_Header.dart';
import 'package:flutter_ecommerce/Commons/Custom_Drawer/drawer_title.dart';
import 'package:flutter_ecommerce/generated/l10n.dart';
import 'package:get_storage/get_storage.dart';

class CustomDrawer extends StatelessWidget {
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          CustomDrawerHeader(),
          DrawerTitle(
              iconData: Icons.list,
              title: LocaleProvider.of(context).cards,
              page: 0),
          DrawerTitle(
              iconData: Icons.settings,
              title: LocaleProvider.of(context).settings,
              page: 1),
          ElevatedButton(
            onPressed: () {
            },
            child: Text("Avalie a gente"),
          ),
        ],
      ),
    );
  }
}
