import 'package:crypto_list/router/router.dart';
import 'package:crypto_list/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

class CryptoApp extends StatelessWidget {
  const CryptoApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: DarkTheme,
      routes: routes,   
      navigatorObservers: [
        TalkerRouteObserver(GetIt.I<Talker>())
      ],  
    );    
  }
}