import 'package:crypto_list/crypto_app.dart';

import 'package:crypto_list/repositories/repositories.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  const cryptoCoinsBoxName="crypto_coins_box";

  WidgetsFlutterBinding.ensureInitialized();
  final talker = TalkerFlutter.init();
  GetIt.I.registerSingleton(talker);
  GetIt.I<Talker>().debug("Talker started...");
  FlutterError.onError=(details)=>GetIt.I<Talker>().handle(details.exception,details.stack);
  final dio=Dio();
  final app= await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  talker.debug(app.options.projectId);

  await Hive.initFlutter();
  Hive.registerAdapter(CryptoCoinAdapter());

  final cryptoCoinsBox=await Hive.openBox<CryptoCoin>(cryptoCoinsBoxName);
  GetIt.I.registerLazySingleton(() => CryptoCoinsRepository(dio: dio,cryptoCoinsBox: cryptoCoinsBox));
  dio.interceptors.add(
    TalkerDioLogger(
      talker: talker,
        settings: const TalkerDioLoggerSettings(
          printResponseData: false,
        ),
    ),
  );
  runApp(const CryptoApp());
}




