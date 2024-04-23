import 'package:flutter/material.dart';
import 'package:music_player_flutter_app/helpers/helpers.dart';

// Widget contenedor encargado de mostrar la letra de la canción (lírica)
class Lyric extends StatelessWidget {
  const Lyric({super.key});

  @override
  Widget build(BuildContext context) {
    // Recuperar la letra de la canción por medio de mi helper
    final lyrics = getLyrics();

    // Este widget ocupará todo el espacio disponible
    return Expanded(
      // ListWheelScrollView proporciona una forma de mostrar una lista de elementos en forma de rueda giratoria, similar a un selector giratorio de fechas en iOS.
      child: ListWheelScrollView(
        physics: const BouncingScrollPhysics(),
        // El tamaño de los elementos en el eje principal (alto)
        itemExtent: 32,
        // Factor que determina el tamaño de la rueda giratoria en relación con el tamaño de los elementos indiiduales
        // Un valor alto hará que la rueda sea más pequeña (los elementos se unan más), un valor pequeño hará que la rueda sea más grande (los elementos se separen más)
        diameterRatio: 1.4,
        // Por cada estrofa en la lírica, se genera un widget de texto, al final se convierte en una listsa de Text
        children: lyrics
            .map((phrase) => Text(
                  phrase,
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.6), fontSize: 16),
                ))
            .toList(),
      ),
    );
  }
}
