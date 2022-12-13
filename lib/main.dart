import 'package:expense/screen/home_screen.dart';
import 'package:flutter/material.dart';

final ThemeData tema = ThemeData();

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Despesas Pessoais',
      theme: tema.copyWith(
        colorScheme: tema.colorScheme.copyWith(
          primary: Colors.deepOrange,
          secondary: const  Color.fromARGB(255, 106, 0, 0),
        ),
        textTheme: tema.textTheme.copyWith(
          headline6: const TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          button: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          )
        ),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ), 
          ),
      ),
      home: const HomeScreen(),
    ));
