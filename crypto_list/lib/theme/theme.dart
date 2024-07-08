import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

final DarkTheme = 
  ThemeData(
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.yellow),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Color.fromARGB(255, 255, 255, 255),fontWeight: FontWeight.w500,fontSize: 20),
      labelSmall: TextStyle(color: Color.fromARGB(206, 207, 207, 207),fontWeight: FontWeight.w400,fontSize: 16),
      bodyLarge: TextStyle(color: Color.fromARGB(255, 255, 255, 255),fontWeight: FontWeight.w600,fontSize: 25),
      bodySmall: TextStyle(color: Color.fromARGB(255, 255, 255, 255),fontWeight: FontWeight.w500,fontSize: 16)
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
      actionsIconTheme: IconThemeData(color: Colors.white),
      centerTitle: true,  
      surfaceTintColor: Colors.transparent,
      backgroundColor: Color.fromARGB(255, 44, 44, 44),   
      titleTextStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255),fontWeight: FontWeight.w500,fontSize: 24)
    ),
    scaffoldBackgroundColor: const Color.fromARGB(255, 34, 34, 34),
    dividerTheme: const DividerThemeData(
      color: Color.fromARGB(97, 255, 255, 255),
    ),
    iconButtonTheme: const IconButtonThemeData(),
    
    useMaterial3: true,
    
    
  );