// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class LocaleProvider {
  LocaleProvider();
  
  static LocaleProvider current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<LocaleProvider> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      LocaleProvider.current = LocaleProvider();
      
      return LocaleProvider.current;
    });
  } 

  static LocaleProvider of(BuildContext context) {
    return Localizations.of<LocaleProvider>(context, LocaleProvider);
  }

  /// `Dark Mode`
  String get dark_mode {
    return Intl.message(
      'Dark Mode',
      name: 'dark_mode',
      desc: '',
      args: [],
    );
  }

  /// `English in production`
  String get english {
    return Intl.message(
      'English in production',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Portuguese`
  String get portuguese {
    return Intl.message(
      'Portuguese',
      name: 'portuguese',
      desc: '',
      args: [],
    );
  }

  /// `Change Language`
  String get change_lenguage {
    return Intl.message(
      'Change Language',
      name: 'change_lenguage',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get welcome {
    return Intl.message(
      'Welcome',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Login or Register`
  String get login_register {
    return Intl.message(
      'Login or Register',
      name: 'login_register',
      desc: '',
      args: [],
    );
  }

  /// `Cards`
  String get cards {
    return Intl.message(
      'Cards',
      name: 'cards',
      desc: '',
      args: [],
    );
  }

  /// `My Orders`
  String get my_ordes {
    return Intl.message(
      'My Orders',
      name: 'my_ordes',
      desc: '',
      args: [],
    );
  }

  /// `My Cart`
  String get my_cart {
    return Intl.message(
      'My Cart',
      name: 'my_cart',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get create_account {
    return Intl.message(
      'Create Account',
      name: 'create_account',
      desc: '',
      args: [],
    );
  }

  /// `Forgot My Password`
  String get forgot_password {
    return Intl.message(
      'Forgot My Password',
      name: 'forgot_password',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get log_in {
    return Intl.message(
      'Login',
      name: 'log_in',
      desc: '',
      args: [],
    );
  }

  /// `User Registration`
  String get user_account {
    return Intl.message(
      'User Registration',
      name: 'user_account',
      desc: '',
      args: [],
    );
  }

  /// `Personal Data`
  String get persona_data {
    return Intl.message(
      'Personal Data',
      name: 'persona_data',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Number`
  String get number {
    return Intl.message(
      'Number',
      name: 'number',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Repeat your password`
  String get repeat_password {
    return Intl.message(
      'Repeat your password',
      name: 'repeat_password',
      desc: '',
      args: [],
    );
  }

  /// `Delivery Address`
  String get delivery_address {
    return Intl.message(
      'Delivery Address',
      name: 'delivery_address',
      desc: '',
      args: [],
    );
  }

  /// `Street`
  String get street {
    return Intl.message(
      'Street',
      name: 'street',
      desc: '',
      args: [],
    );
  }

  /// `District`
  String get district {
    return Intl.message(
      'District',
      name: 'district',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get city {
    return Intl.message(
      'City',
      name: 'city',
      desc: '',
      args: [],
    );
  }

  /// `State`
  String get state {
    return Intl.message(
      'State',
      name: 'state',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Effect`
  String get Effect {
    return Intl.message(
      'Effect',
      name: 'Effect',
      desc: '',
      args: [],
    );
  }

  /// `Fusion`
  String get Fusion {
    return Intl.message(
      'Fusion',
      name: 'Fusion',
      desc: '',
      args: [],
    );
  }

  /// `Pendulum`
  String get Pendulum {
    return Intl.message(
      'Pendulum',
      name: 'Pendulum',
      desc: '',
      args: [],
    );
  }

  /// `Synchro`
  String get Synchro {
    return Intl.message(
      'Synchro',
      name: 'Synchro',
      desc: '',
      args: [],
    );
  }

  /// `Skill Card`
  String get Skill {
    return Intl.message(
      'Skill Card',
      name: 'Skill',
      desc: '',
      args: [],
    );
  }

  /// `Aqua`
  String get Aqua {
    return Intl.message(
      'Aqua',
      name: 'Aqua',
      desc: '',
      args: [],
    );
  }

  /// `Beast`
  String get Beast {
    return Intl.message(
      'Beast',
      name: 'Beast',
      desc: '',
      args: [],
    );
  }

  /// `Creator-God`
  String get Creator_God {
    return Intl.message(
      'Creator-God',
      name: 'Creator_God',
      desc: '',
      args: [],
    );
  }

  /// `Cyberso`
  String get Cyberse {
    return Intl.message(
      'Cyberso',
      name: 'Cyberse',
      desc: '',
      args: [],
    );
  }

  /// `Dinosaur`
  String get Dinosaur {
    return Intl.message(
      'Dinosaur',
      name: 'Dinosaur',
      desc: '',
      args: [],
    );
  }

  /// `Fairy`
  String get Fairy {
    return Intl.message(
      'Fairy',
      name: 'Fairy',
      desc: '',
      args: [],
    );
  }

  /// `Beast-Warrior`
  String get Beast_Warrior {
    return Intl.message(
      'Beast-Warrior',
      name: 'Beast_Warrior',
      desc: '',
      args: [],
    );
  }

  /// `Divine-Beast`
  String get Divine_Beast {
    return Intl.message(
      'Divine-Beast',
      name: 'Divine_Beast',
      desc: '',
      args: [],
    );
  }

  /// `Dragon`
  String get Dragon {
    return Intl.message(
      'Dragon',
      name: 'Dragon',
      desc: '',
      args: [],
    );
  }

  /// `Fiend`
  String get Fiend {
    return Intl.message(
      'Fiend',
      name: 'Fiend',
      desc: '',
      args: [],
    );
  }

  /// `Fish`
  String get Fish {
    return Intl.message(
      'Fish',
      name: 'Fish',
      desc: '',
      args: [],
    );
  }

  /// `Insect`
  String get Insect {
    return Intl.message(
      'Insect',
      name: 'Insect',
      desc: '',
      args: [],
    );
  }

  /// `Máquina`
  String get Machine {
    return Intl.message(
      'Máquina',
      name: 'Machine',
      desc: '',
      args: [],
    );
  }

  /// `Plant`
  String get Plant {
    return Intl.message(
      'Plant',
      name: 'Plant',
      desc: '',
      args: [],
    );
  }

  /// `Psychic`
  String get Psychic {
    return Intl.message(
      'Psychic',
      name: 'Psychic',
      desc: '',
      args: [],
    );
  }

  /// `Pyro`
  String get Pyro {
    return Intl.message(
      'Pyro',
      name: 'Pyro',
      desc: '',
      args: [],
    );
  }

  /// `Reptile`
  String get Reptile {
    return Intl.message(
      'Reptile',
      name: 'Reptile',
      desc: '',
      args: [],
    );
  }

  /// `Rock`
  String get Rock {
    return Intl.message(
      'Rock',
      name: 'Rock',
      desc: '',
      args: [],
    );
  }

  /// `Sea Serpent`
  String get Sea_Serpent {
    return Intl.message(
      'Sea Serpent',
      name: 'Sea_Serpent',
      desc: '',
      args: [],
    );
  }

  /// `Spellcaster`
  String get Spellcaster {
    return Intl.message(
      'Spellcaster',
      name: 'Spellcaster',
      desc: '',
      args: [],
    );
  }

  /// `Thunder`
  String get Thunder {
    return Intl.message(
      'Thunder',
      name: 'Thunder',
      desc: '',
      args: [],
    );
  }

  /// `Warrior`
  String get Warrior {
    return Intl.message(
      'Warrior',
      name: 'Warrior',
      desc: '',
      args: [],
    );
  }

  /// `Winged Beast`
  String get Winged_Beast {
    return Intl.message(
      'Winged Beast',
      name: 'Winged_Beast',
      desc: '',
      args: [],
    );
  }

  /// `DARK`
  String get DARK {
    return Intl.message(
      'DARK',
      name: 'DARK',
      desc: '',
      args: [],
    );
  }

  /// `EARTH`
  String get EARTH {
    return Intl.message(
      'EARTH',
      name: 'EARTH',
      desc: '',
      args: [],
    );
  }

  /// `FIRE`
  String get FIRE {
    return Intl.message(
      'FIRE',
      name: 'FIRE',
      desc: '',
      args: [],
    );
  }

  /// `LIGHT`
  String get LIGHT {
    return Intl.message(
      'LIGHT',
      name: 'LIGHT',
      desc: '',
      args: [],
    );
  }

  /// `WATER`
  String get WATER {
    return Intl.message(
      'WATER',
      name: 'WATER',
      desc: '',
      args: [],
    );
  }

  /// `WIND`
  String get WIND {
    return Intl.message(
      'WIND',
      name: 'WIND',
      desc: '',
      args: [],
    );
  }

  /// `DIVINE`
  String get DIVINE {
    return Intl.message(
      'DIVINE',
      name: 'DIVINE',
      desc: '',
      args: [],
    );
  }

  /// `Normal Magic`
  String get Magic_Normal {
    return Intl.message(
      'Normal Magic',
      name: 'Magic_Normal',
      desc: '',
      args: [],
    );
  }

  /// `Field Magic`
  String get Magic_Field {
    return Intl.message(
      'Field Magic',
      name: 'Magic_Field',
      desc: '',
      args: [],
    );
  }

  /// `Equip Magic`
  String get Magic_Equip {
    return Intl.message(
      'Equip Magic',
      name: 'Magic_Equip',
      desc: '',
      args: [],
    );
  }

  /// `Continuous Magic`
  String get Magic_Continuous {
    return Intl.message(
      'Continuous Magic',
      name: 'Magic_Continuous',
      desc: '',
      args: [],
    );
  }

  /// `Quick-Play`
  String get Quick_Play {
    return Intl.message(
      'Quick-Play',
      name: 'Quick_Play',
      desc: '',
      args: [],
    );
  }

  /// `Ritual Magic`
  String get Magic_Ritual {
    return Intl.message(
      'Ritual Magic',
      name: 'Magic_Ritual',
      desc: '',
      args: [],
    );
  }

  /// `Normal Trap`
  String get Trap_Normal {
    return Intl.message(
      'Normal Trap',
      name: 'Trap_Normal',
      desc: '',
      args: [],
    );
  }

  /// `Trap Counter `
  String get Trap_counter {
    return Intl.message(
      'Trap Counter ',
      name: 'Trap_counter',
      desc: '',
      args: [],
    );
  }

  /// `Continuous Trap`
  String get Trap_Continuous {
    return Intl.message(
      'Continuous Trap',
      name: 'Trap_Continuous',
      desc: '',
      args: [],
    );
  }

  /// `Type Card`
  String get type_card {
    return Intl.message(
      'Type Card',
      name: 'type_card',
      desc: '',
      args: [],
    );
  }

  /// `Attribute`
  String get attribute {
    return Intl.message(
      'Attribute',
      name: 'attribute',
      desc: '',
      args: [],
    );
  }

  /// `Type`
  String get type {
    return Intl.message(
      'Type',
      name: 'type',
      desc: '',
      args: [],
    );
  }

  /// `Magic Card`
  String get card_magic {
    return Intl.message(
      'Magic Card',
      name: 'card_magic',
      desc: '',
      args: [],
    );
  }

  /// `Trap Card`
  String get card_trap {
    return Intl.message(
      'Trap Card',
      name: 'card_trap',
      desc: '',
      args: [],
    );
  }

  /// `Monster`
  String get monster {
    return Intl.message(
      'Monster',
      name: 'monster',
      desc: '',
      args: [],
    );
  }

  /// `and`
  String get and {
    return Intl.message(
      'and',
      name: 'and',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Shit`
  String get shit {
    return Intl.message(
      'Shit',
      name: 'shit',
      desc: '',
      args: [],
    );
  }

  /// `Could not find these cards`
  String get Could_not_find_these_cards {
    return Intl.message(
      'Could not find these cards',
      name: 'Could_not_find_these_cards',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Prices`
  String get prices {
    return Intl.message(
      'Prices',
      name: 'prices',
      desc: '',
      args: [],
    );
  }

  /// `Related Letter`
  String get carrelated_letterds {
    return Intl.message(
      'Related Letter',
      name: 'carrelated_letterds',
      desc: '',
      args: [],
    );
  }

  /// `Attack`
  String get attack {
    return Intl.message(
      'Attack',
      name: 'attack',
      desc: '',
      args: [],
    );
  }

  /// `Defense`
  String get defense {
    return Intl.message(
      'Defense',
      name: 'defense',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<LocaleProvider> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'pt'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<LocaleProvider> load(Locale locale) => LocaleProvider.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}