import 'package:crypto_list/repositories/repositories.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'crypto_list_event.dart';
part 'crypto_list_state.dart';

class CryptoListBloc extends Bloc<CryptoListEvent, CryptoListState> {
  CryptoListBloc(this._repository) : super(CryptoListInitial()) {
    on<LoadCryptoList>((event, emit) async {
      try {
        if(state is! CryptoListLoaded){
          emit(CryptoListLoading());
        }
        final coinsList = await _repository.getCoinsList();
        emit(CryptoListLoaded(coinsList: coinsList));
  } catch (e,st) {
    emit(CryptoListError(errorMessage: e));
    GetIt.I<Talker>().handle(e,st);
  }
    });
  }
  final CryptoCoinsRepository _repository;
}