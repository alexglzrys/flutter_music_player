import 'package:flutter/material.dart';
import 'package:music_player_flutter_app/widgets/cover_and_duration.dart';
import 'package:music_player_flutter_app/widgets/custom_app_bar.dart';

// Widget referente a la pantalla principal de la aplicación
class PlayerScreen extends StatelessWidget {
  const PlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          // Barra de aplicaciones
          CustomAppBar(),
          // Portada y Duración
          CoverAndDuration(),
        ],
      ),
    );
  }
}
