import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_ecommerce/Screens/Base/base_screen.dart';
import 'package:flutter_ecommerce/Screens/Cards/detail_card.dart';
import 'package:flutter_ecommerce/Screens/Config/config_screen.dart';
import 'package:flutter_ecommerce/Utils/pallete_color.dart';
import 'package:flutter_ecommerce/generated/l10n.dart';
import 'package:flutter_ecommerce/model/Manager/config_manager.dart';
import 'package:flutter_ecommerce/model/card/card_detail_dto.dart';
import 'package:flutter_ecommerce/model/card/cards_list.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

void main() async {
  configLoading();
  await GetStorage.init();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => ThemeAppConfig(),
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
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeAppConfig>(builder: (_, themeAppConfig, __) {
      return MaterialApp(
        title: 'YU-GI-OH',
        scrollBehavior: MaterialScrollBehavior().copyWith(
          dragDevices: {
            PointerDeviceKind.mouse,
            PointerDeviceKind.touch,
            PointerDeviceKind.stylus,
            PointerDeviceKind.unknown,
            PointerDeviceKind.trackpad,
            PointerDeviceKind.invertedStylus
          },
        ),
        debugShowCheckedModeBanner: false,
        supportedLocales: LocaleProvider.delegate.supportedLocales,
        localizationsDelegates: const [
          RefreshLocalizations.delegate,
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
            case '/settings':
              return MaterialPageRoute(builder: (_) => ConfigScreen());
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
