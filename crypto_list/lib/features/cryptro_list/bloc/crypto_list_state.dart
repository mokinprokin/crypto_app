part of 'crypto_list_bloc.dart';
abstract class CryptoListState extends Equatable {
}
class CryptoListInitial extends CryptoListState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class CryptoListLoading extends CryptoListState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class CryptoListLoaded extends CryptoListState{
  final List<CryptoCoin> coinsList;

  CryptoListLoaded({required this.coinsList});
  
  @override
  // TODO: implement props
  List<Object?> get props => [coinsList];
}

class CryptoListError extends CryptoListState{
  final Object? errorMessage;

 CryptoListError({required this.errorMessage});
 
  @override
  // TODO: implement props
  List<Object?> get props => [errorMessage];

}