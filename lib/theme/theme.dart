import 'package:flutter/material.dart';

// ? Tema personalizado
// El tema que se toma como base para realizar los ajustes es el tema Dark
final musicPlayerTheme = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: const Color(0xff201E28),
  iconTheme: IconThemeData(
    color: Colors.white.withOpacity(0.3),
  ),
);
