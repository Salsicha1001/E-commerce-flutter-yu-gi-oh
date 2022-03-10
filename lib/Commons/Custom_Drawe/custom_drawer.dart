import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/Commons/Custom_Drawe/drawer_title.dart';

class CustomDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const DrawerTitle(iconData: Icons.home, title: "Home", page: 0),
          const DrawerTitle(iconData: Icons.list, title: "Cartas", page: 1),
          const DrawerTitle(
              iconData: Icons.playlist_add_check,
              title: "Meus Pedidos",
              page: 2),
          const DrawerTitle(
              iconData: Icons.favorite,
              title: "Minhas Cartas Preferidas",
              page: 3),
              const DrawerTitle(
              iconData: Icons.settings,
              title: "Configurações",
              page: 3),
        ],
      ),
    );
  }
}
