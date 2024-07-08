import 'package:crypto_list/features/cryptro_list/bloc/crypto_list_bloc.dart';
import 'package:crypto_list/features/cryptro_list/widgets/widgets.dart';
import 'package:crypto_list/repositories/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';
class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _CryptoListScreenState createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  final _cryptoListBloc=CryptoListBloc(GetIt.I<CryptoCoinsRepository>());


  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(icon: Icon(Icons.document_scanner), onPressed: ()  => Navigator.of(context).push(MaterialPageRoute(builder: (context)=>TalkerScreen(talker: GetIt.I<Talker>())))),
        ],
      ),
      body: RefreshIndicator(
        backgroundColor: Colors.black26,
        onRefresh: () async {_cryptoListBloc.add(LoadCryptoList());} ,
        child:  BlocBuilder<CryptoListBloc, CryptoListState>(
        builder: (context, state) {
          if(state is CryptoListLoaded){
            return ListView.separated(
              padding: EdgeInsets.only(top: 8),
              itemCount: state.coinsList.length,
              separatorBuilder: (context, index) => Divider(),
              itemBuilder: (context, i) {
                final coin = state.coinsList[i];
                return CryptoCoinTile(coin: coin);
              },
            );
          

          }
          if (state is CryptoListError){
            return Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Something went wrong",
                    style: _theme.textTheme.bodyMedium,
                  ),
                  Text(
                    "Please try again later",
                    style: _theme.textTheme.labelSmall,
                    ),
                  const SizedBox(height: 10,),
                  TextButton(child: const Text("Try again",),
                    onPressed: ()  {_cryptoListBloc.add(LoadCryptoList());}
                  )
               ],
              ),
              
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
        bloc: _cryptoListBloc,
      ) )
      

    );
  }
    @override
  void initState() {
    super.initState();
    _cryptoListBloc.add(LoadCryptoList());
  }


}