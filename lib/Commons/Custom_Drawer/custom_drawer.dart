import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/Commons/Custom_Drawer/Custom_Drawer_Header.dart';
import 'package:flutter_ecommerce/Commons/Custom_Drawer/drawer_title.dart';
import 'package:flutter_ecommerce/generated/l10n.dart';
import 'package:flutter_ecommerce/model/user_model.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          CustomDrawerHeader(),
          const DrawerTitle(iconData: Icons.home, title: "Home", page: 0),
          DrawerTitle(
              iconData: Icons.list,
              title: LocaleProvider.of(context).cards,
              page: 1),
          DrawerTitle(
              iconData: Icons.playlist_add_check,
              title: LocaleProvider.of(context).my_ordes,
              page: 2),
              if(Provider.of<UserManager>(context).isLoggedIn)
          DrawerTitle(
              iconData: Icons.shopping_cart_outlined,
              title: LocaleProvider.of(context).my_cart,
              page: 3),
          DrawerTitle(
              iconData: Icons.settings,
              title: LocaleProvider.of(context).settings,
              page: 4),
        ],
      ),
    );
  }
}
