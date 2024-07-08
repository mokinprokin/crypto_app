
import 'package:crypto_list/repositories/repositories.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:talker_flutter/talker_flutter.dart';

class CryptoCoinsRepository implements AbstractCryptoCoinsRepository{
  final Dio dio;
  final Box<CryptoCoin> cryptoCoinsBox;


  CryptoCoinsRepository({required this.dio,required this.cryptoCoinsBox});

  Future<List<CryptoCoin>> getCoinsList() async{
    var dataList=<CryptoCoin>[];
    try {
      dataList = await _fetchCoinsListFromApi();
      final dataListMap={for (var e in dataList) e.name:e};
      await cryptoCoinsBox.putAll(dataListMap);
    } on Exception catch (e,st) {
      GetIt.I<Talker>().handle(e,st);
      dataList = cryptoCoinsBox.values.toList();
    }
    dataList.sort((a,b) => b.USD.compareTo(a.USD));
    return dataList;
  }

  Future<List<CryptoCoin>> _fetchCoinsListFromApi() async {
    final responce=await dio.get("https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,SOL,BSV,BNB,AVAX,NOT&tsyms=USD,EUR");
    final data = responce.data as Map<String,dynamic>;
    final dataRaw= data["RAW"] as Map<String,dynamic>;
    final dataList = dataRaw.entries.map(
      (e)
      { 
        final usdData=(e.value as Map<String,dynamic>)["USD"] as Map<String,dynamic>;
        final eurData=(e.value as Map<String,dynamic>)["EUR"] as Map<String,dynamic>;
        final imageUrl=usdData['IMAGEURL'];
        final hight24Hour=usdData['HIGH24HOUR'];
        final low24Hour=usdData['LOW24HOUR'];
        return CryptoCoin
      (
        name: e.key, 
        USD: usdData["PRICE"],
        image_url:"https://www.cryptocompare.com/$imageUrl",
        hight24hour: hight24Hour,
        low24hour: low24Hour,
        EUR: eurData["PRICE"],
        );
        }
      ).toList();
    return dataList;
  }
  
  @override
  Future<List<CryptoCoin>> getCryptoCoins() {
    // TODO: implement getCryptoCoins
    throw UnimplementedError();
  }
}