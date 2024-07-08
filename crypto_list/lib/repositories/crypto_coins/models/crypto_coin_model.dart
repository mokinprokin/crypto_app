import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'crypto_coin_model.g.dart';
@HiveType(typeId: 1)
class CryptoCoin extends Equatable{

 CryptoCoin({required this.name, required this.USD,required this.image_url,required this.hight24hour,required this.low24hour,required this.EUR});
  @HiveField(0)
  final String name;
  @HiveField(1)
  final double USD;
  @HiveField(2)
  final double hight24hour;
  @HiveField(3)
  final double low24hour;
  @HiveField(4)
  final image_url;
  @HiveField(5)
  final double EUR;

  @override
  List<Object> get props => [name, USD, image_url,hight24hour,low24hour];
}