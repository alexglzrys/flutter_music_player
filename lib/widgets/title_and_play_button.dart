import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Widget contenedor encargado de mostrar el título de la canción, nombre del artista y el botón de reproducit
class TitleAndPlayButton extends StatelessWidget {
  const TitleAndPlayButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: const Row(
        children: [
          // Titulo de canción y Nombre del artista
          _TitleAndArtist(),
          Spacer(),
          // Botón de reproducir
          _PlayButton(),
          SizedBox(width: 25)
        ],
      ),
    );
  }
}

// Widget privado encargado de mostrar el título de la canción y nombre del artista
class _TitleAndArtist extends StatelessWidget {
  const _TitleAndArtist({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Es el amor',
          style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 24),
        ),
        const SizedBox(height: 3),
        Text(
          'Los brillantes de la Cumbia',
          style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 14),
        ),
      ],
    );
  }
}

// Widget privado encargado de mostrar el botón de reproducir
class _PlayButton extends StatelessWidget {
  const _PlayButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      // Controlar elevación visual del botón flotante y su sombra (cuando es presionado)
      elevation: 0,
      highlightElevation: 0,
      backgroundColor: const Color(0xfff8cb51),
      onPressed: () {},
      child: const Icon(
        FontAwesomeIcons.play,
        size: 20,
      ),
    );
  }
}
