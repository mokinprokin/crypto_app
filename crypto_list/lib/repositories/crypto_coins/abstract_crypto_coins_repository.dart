import 'package:crypto_list/repositories/crypto_coins/models/models.dart';

abstract class AbstractCryptoCoinsRepository {
  Future<List<CryptoCoin>> getCryptoCoins();
}