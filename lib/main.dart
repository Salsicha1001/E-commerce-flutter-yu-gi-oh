import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_ecommerce/Screens/Base/base_screen.dart';
import 'package:flutter_ecommerce/Screens/Cards/detail_card.dart';
import 'package:flutter_ecommerce/Screens/Config/config_screen.dart';
import 'package:flutter_ecommerce/Screens/Shoop/cart_shopp.dart';
import 'package:flutter_ecommerce/Screens/Shoop/list_cred_cards.dart';
import 'package:flutter_ecommerce/Screens/Shoop/shopp_review.dart';
import 'package:flutter_ecommerce/Screens/Users/login_screen.dart';
import 'package:flutter_ecommerce/Screens/Users/register_user.dart';
import 'package:flutter_ecommerce/Utils/pallete_color.dart';
import 'package:flutter_ecommerce/generated/l10n.dart';
import 'package:flutter_ecommerce/model/Manager/card_shopp_manager.dart';
import 'package:flutter_ecommerce/model/Manager/config_manager.dart';
import 'package:flutter_ecommerce/model/card/card_detail_dto.dart';
import 'package:flutter_ecommerce/model/card/cards_list.dart';
import 'package:flutter_ecommerce/model/payament/cred-card.model.dart';
import 'package:flutter_ecommerce/model/user_model.dart';
import 'package:flutter_ecommerce/services/authtenticador-service.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

void main() async {
  configLoading();
  await GetStorage.init();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => UserManager(),
        lazy: false,
      ),
      ChangeNotifierProvider(
        create: (context) => ThemeAppConfig(),
        lazy: false,
      ),
      ChangeNotifierProvider(
        create: (context) => CartShoppManager(),
        lazy: false,
      ),
      ChangeNotifierProxyProvider<UserManager, CartShoppManager>(
          create: (_) => CartShoppManager(),
          lazy: false,
          update: (_, userManager, cartManager) => cartManager),
      Provider(
        create: (_) => UserService(),
        lazy: false,
      ),
      Provider(
        create: (_) => BaseScreen(),
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

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<User> getUser() async {
    final box = GetStorage();
    if (box.read('jwt') != null) {
      User u = User(
          id_user: box.read('id'),
          email: box.read('email'),
          name: box.read('name'),
          token: box.read('jwt'));
      return u;
    }
  }

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
            case '/cart':
              return MaterialPageRoute(builder: (_) => CartShoopScreen());
            case '/list_creds':
              return MaterialPageRoute(
                  builder: (_) =>
                      ListCredCards(settings.arguments as List<CredCart>));
            case '/review':
              return MaterialPageRoute(
                  builder: (_) =>
                      ShoppReview(settings.arguments as CredCart));
            case '/detail-card':
              List<dynamic> args = settings.arguments;
              return MaterialPageRoute(
                builder: (_) => CardDetail(
                    args[0] as CardDetailDto, args[1] as List<CardList>),
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
