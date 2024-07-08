import 'package:flutter/material.dart';

class CryptoCoinScreen extends StatefulWidget {
  const CryptoCoinScreen({super.key});

  @override
  State<CryptoCoinScreen> createState() => _CryptoCoinScreenState();
}

class _CryptoCoinScreenState extends State<CryptoCoinScreen> {
  Map? coin;

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    assert(args != null && args is Map,'You must provide map args');
    coin= args as Map;
    setState(() {});
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
      final ThemeData _theme = Theme.of(context);
    return Scaffold(
      
      appBar: AppBar(
        title: Text(coin!["coinName"] ?? '...', style: _theme.textTheme.bodyMedium,),
        iconTheme: IconThemeData(color: Colors.white,),
      ),
      body: Column(
        
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40,bottom: 30),
                 
            child: Center(
              child: Image.network(coin!["image_url"],width: 200,),
            ),
          ),
          Text(coin!["coinName"] ?? "...", style: _theme.textTheme.bodyLarge,),
          Padding( 
             
            padding: EdgeInsets.all(15),        
            child: Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(color: Colors.black12,    
              borderRadius: const BorderRadius.all(Radius.circular(20))),
              child: Center(
                child: Column(children: [
                  Text("${coin!['USD'].toString().substring(0,10)} \$",style: _theme.textTheme.bodyLarge,),
                  Text("${coin!['EUR'].toString().substring(0,10)} €",style: _theme.textTheme.bodyLarge,)
                ],)
                
                
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
            padding: const EdgeInsets.all(15),         
            decoration: const BoxDecoration(color: Colors.black12,    
            borderRadius: BorderRadius.all(Radius.circular(20))),
            child: 
              Column(
                children: [
                  Padding(padding: const EdgeInsets.only(bottom: 3),child:Text("Hight 24 hours:    ${coin!['hight24hour'].toString().substring(0,10)} \$",style: _theme.textTheme.bodySmall,)),
                  Text("Low 24 hours:      ${coin!['low24hour'].toString().substring(0,10)} \$",style: _theme.textTheme.bodySmall,),

                ]
              ),
            ),
          )


        ]
      ,),
      
    );
  }
}
