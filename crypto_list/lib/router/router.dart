import 'package:crypto_list/features/crypto_coin/crypto_coin.dart';
import 'package:crypto_list/features/cryptro_list/crypto_list.dart';

final routes = {
  '/': (context) => const CryptoListScreen(title: "Crypto CoinsList"),
  '/coin': (context) => const CryptoCoinScreen()
};