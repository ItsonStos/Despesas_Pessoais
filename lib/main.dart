import 'package:expense/screen/home_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Despesas Pessoais',
      theme: ThemeData(
        brightness: Brightness.light,
        fontFamily: 'Quicksand',
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
            // ignore: prefer_const_constructors
            titleLarge: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ).copyWith(
        colorScheme: ThemeData().colorScheme.copyWith(
          primary: Colors.deepOrange,
          secondary: Colors.amberAccent,
        )
      ),
      home: const HomeScreen(),
    ));
