import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/Screens/Base/home_screen.dart';
import 'package:flutter_ecommerce/Screens/Cards/cards_screens.dart';
import 'package:flutter_ecommerce/Screens/Config/config_screen.dart';
import 'package:flutter_ecommerce/Screens/Orders/Orders.Screen.dart';
import 'package:flutter_ecommerce/Screens/Shoop/cart_shopp.dart';
import 'package:flutter_ecommerce/model/page_manager.dart';
import 'package:flutter_ecommerce/model/user_model.dart';
import 'package:flutter_ecommerce/services/authtenticador-service.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

class BaseScreen extends StatefulWidget {
  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  final PageController pageController = PageController();
  final box = GetStorage();


  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      UserService().getUserLoged(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Provider(
        create: (_) => PageManager(pageController),
        child: Consumer<UserManager>(builder: (_, userMaager, __) {
          return PageView(
            controller: pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
             HomeScreen(),
              CardsScreen(),
             OrdesScreen(isAdmin: false),
            CartShoopScreen(),
              ConfigScreen(),
             OrdesScreen(isAdmin:true),
              
            ],
          );
        }));
  }
}
