import 'package:flutter/material.dart';
import 'package:cross/presentation/cross.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final crossTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 226, 183, 20),
    primary: const Color.fromARGB(255, 226, 183, 20),
    background: const Color.fromARGB(255, 50, 52, 55),
    secondary: const Color.fromARGB(255, 44, 46, 49),
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontSize: 23,
      color: Color.fromARGB(255, 226, 183, 20),
      fontFamily: 'JetBrainsMono',
      fontWeight: FontWeight.w700,
    ),
    bodyLarge: TextStyle(
      fontSize: 20,
      color: Color.fromARGB(255, 226, 183, 20),
      fontFamily: 'JetBrainsMono',
    ),
    bodySmall: TextStyle(
      fontSize: 20,
      color: Color.fromARGB(255, 226, 183, 20),
      fontFamily: 'JetBrainsMono',
      fontWeight: FontWeight.w900,
    ),
    labelLarge: TextStyle(
      fontSize: 14,
      color: Color.fromARGB(255, 100, 102, 105),
      fontFamily: 'JetBrainsMono',
      fontWeight: FontWeight.w900,
    ),
    labelSmall: TextStyle(
        fontSize: 10,
        color: Color.fromARGB(255, 100, 102, 105),
        fontFamily: 'JetBrainsMono',
        fontWeight: FontWeight.w900),
  ),
);


void main() => runApp(
      ProviderScope(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const Cross(),
          theme: crossTheme,
        ),
      ),
    );
