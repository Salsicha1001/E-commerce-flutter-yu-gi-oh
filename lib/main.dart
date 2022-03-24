import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_ecommerce/Screens/Base/base_screen.dart';
import 'package:flutter_ecommerce/Screens/Cards/detail_card.dart';
import 'package:flutter_ecommerce/Screens/Config/config_screen.dart';
import 'package:flutter_ecommerce/Screens/Users/login_screen.dart';
import 'package:flutter_ecommerce/Screens/Users/register_user.dart';
import 'package:flutter_ecommerce/Utils/pallete_color.dart';
import 'package:flutter_ecommerce/generated/l10n.dart';
import 'package:flutter_ecommerce/model/Manager/card_manager.dart';
import 'package:flutter_ecommerce/model/Manager/config_manager.dart';
import 'package:flutter_ecommerce/model/card/card_detail_dto.dart';
import 'package:flutter_ecommerce/model/card/cards_list.dart';
import 'package:flutter_ecommerce/model/user_model.dart';
import 'package:flutter_ecommerce/services/authtenticador-service.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() async {
  configLoading();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => CardManager(),
        lazy: false,
      ),
      ChangeNotifierProvider(
        create: (context) => UserManager(),
        lazy: false,
      ),
      ChangeNotifierProvider(
        create: (context) => ThemeAppConfig(),
        lazy: false,
      ),
      Provider(
        create: (_) => UserService(),
        lazy: false,
      ),
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
    return Consumer<ThemeAppConfig>(builder: (_, themeAppConfig, __) {
      return MaterialApp(
        title: 'YU-GI-OH shopp',
        supportedLocales: LocaleProvider.delegate.supportedLocales,
        localizationsDelegates: const [
          LocaleProvider.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        locale: themeAppConfig.getLocale,
        theme: ThemeData(
          primarySwatch: generateMaterialColor(Palette.primary),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          appBarTheme: const AppBarTheme(elevation: 0),
          scaffoldBackgroundColor: const Color(0xFF000080),
          brightness:
              themeAppConfig.getTheme ? Brightness.dark : Brightness.light,
        ),
        initialRoute: '/',
        builder: EasyLoading.init(),
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/signup':
              return MaterialPageRoute(builder: (_) => RegisterUser());
            case '/login':
              return MaterialPageRoute(builder: (_) => LoginScreen());
            case '/settings':
              return MaterialPageRoute(builder: (_) => ConfigScreen());
            case '/detail-card':
              return MaterialPageRoute(
                builder: (_) => CardDetail(settings.arguments as CardDetailDto),
              );
            case '/':
            default:
              return MaterialPageRoute(builder: (_) => BaseScreen());
          }
        },
      );
    });
  }
}
