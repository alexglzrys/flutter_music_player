import 'package:flutter/material.dart';
import 'package:music_player_flutter_app/widgets/cover_and_duration.dart';
import 'package:music_player_flutter_app/widgets/custom_app_bar.dart';
import 'package:music_player_flutter_app/widgets/liryc.dart';
import 'package:music_player_flutter_app/widgets/title_and_play_button.dart';

// Widget referente a la pantalla principal de la aplicación
class PlayerScreen extends StatelessWidget {
  const PlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // Fondo y Contenido Principal
      body: Stack(
        children: [
          // Fondo gradiente
          _Background(),
          // Contenido principal
          Column(
            children: [
              // Barra de aplicaciones
              CustomAppBar(),
              // Portada y Duración
              CoverAndDuration(),
              // Título y botón de reproducir
              TitleAndPlayButton(),
              // Lírica o letra de la canción
              Lyric(),
            ],
          ),
        ],
      ),
    );
  }
}

// Widget referente al fondo degradado de la pantalla
class _Background extends StatelessWidget {
  const _Background({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Obtener el tamaño real de la pantalla
    final screenSize = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      // El alto de este widget será del 80% de la pantalla del dispositivo
      height: screenSize.height * 0.8,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60)),
        gradient: LinearGradient(
          colors: [
            Color(0xff33333e),
            Color(0xff201e28),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.center,
        ),
      ),
    );
  }
}
