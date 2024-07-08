

import 'package:crypto_list/repositories/repositories.dart';
import 'package:flutter/material.dart';

class CryptoCoinTile extends StatelessWidget {
  const CryptoCoinTile({
    super.key,
    required this.coin,
  });

  final CryptoCoin coin;

  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);
    return ListTile(
      leading: Image.network(coin.image_url),
      title: Text(
        coin.name,
        style: _theme.textTheme.bodyMedium,
      ),
      subtitle: Text(
        coin.USD.toString()+"\$",
        style:  _theme.textTheme.labelSmall,
      ),
      trailing: const Icon(Icons.arrow_forward,color: Colors.white,),
      onTap: (){
        Navigator.of(context).pushNamed(
          '/coin',
        arguments: {
          'coinName': coin.name,
          'USD': coin.USD,
          'image_url': coin.image_url,
          'hight24hour': coin.hight24hour,
          'low24hour': coin.low24hour ,
          'EUR': coin.EUR ,
        },
        );
      },
    );
  }
}
