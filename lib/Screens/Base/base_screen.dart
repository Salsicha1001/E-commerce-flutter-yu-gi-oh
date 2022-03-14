import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/Commons/Custom_Drawe/custom_drawer.dart';
import 'package:flutter_ecommerce/model/page_manager.dart';
import 'package:provider/provider.dart';

class BaseScreen extends StatelessWidget {

  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_)=>PageManager(pageController),
      child: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Scaffold(
            drawer: CustomDrawer(),
            appBar: AppBar(
              title: const Text('Home'),
            ),
          ),
        ],
      ),
    );
  }
}
