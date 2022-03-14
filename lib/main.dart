import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_ecommerce/Screens/Base/base_screen.dart';
import 'package:flutter_ecommerce/Screens/Users/login_screen.dart';
import 'package:flutter_ecommerce/Screens/Users/register_user.dart';
import 'package:flutter_ecommerce/model/user_model.dart';
import 'package:flutter_ecommerce/services/authtenticador-service.dart';
import 'package:provider/provider.dart';

void main() {
  configLoading();
  runApp(MultiProvider(
    providers: [
    ChangeNotifierProvider(create: (context) => UserManager(), lazy: false,),
    ],
    child: MyApp(),
  ));
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => UserService(),
      child: MaterialApp(
        title: 'YU-GI-OH shopp',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          appBarTheme: const AppBarTheme(elevation: 0),
          scaffoldBackgroundColor: Colors.indigo,
          // brightness: Brightness.dark,
        ),
        initialRoute: '/',
        builder: EasyLoading.init(),
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/signup':
              return MaterialPageRoute(builder: (_) => RegisterUser());
            case '/login':
              return MaterialPageRoute(builder: (_) => LoginScreen());
            case '/':
            default:
              return MaterialPageRoute(builder: (_) => BaseScreen());
          }
        },
      ),
    );
  }
}
