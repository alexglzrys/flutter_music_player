import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:music_player_flutter_app/providers/music_player_provider.dart';
import 'package:provider/provider.dart';

// Widget que representa la portada y duración de la pista musical
class CoverAndDuration extends StatelessWidget {
  const CoverAndDuration({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 36),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: const Row(
        children: [
          // Portada
          _Cover(),
          Spacer(),
          // Duración
          _Duration(),
          SizedBox(width: 30)
        ],
      ),
    );
  }
}

// Widget privado para representar la portada (en forma de disco de viníl)
class _Cover extends StatelessWidget {
  const _Cover({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      padding: const EdgeInsets.all(14),
      decoration: _coverDecoration(),
      // La portada se mostrará en diseño de disco de acetato o viníl
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Stack(
            // El contenido de esta pila de elementos debe estar centrada
            alignment: Alignment.center,
            children: [
              // Portada de disco
              const _CompactDisc(),
              // Orificios centrales del disco
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                  color: const Color(0xff1c1c25),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ]),
      ),
    );
  }

  // Método privado encargado de la decoración de la portada
  BoxDecoration _coverDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(100),
      gradient: const LinearGradient(
        colors: [
          Color(0xff484750),
          Color(0xff1e1c24),
        ],
        begin: Alignment.topLeft,
      ),
    );
  }
}

// Widget privado para representar la duración y progreso de la pista actual
class _Duration extends StatelessWidget {
  const _Duration({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Requerir la instancia de mi Provider
    final musicPlayerProvider = Provider.of<MusicPlayerProvider>(context);
    // Variable local para almacenar el color del texto referente a la duración
    final colorTextDuration = Colors.white.withOpacity(0.4);
    return Column(
      children: [
        // Duración total de la pista musical
        Text(
          musicPlayerProvider.songTotalDurationFormated,
          style: TextStyle(color: colorTextDuration),
        ),
        const SizedBox(height: 10),
        // Barra de progreso
        const _Progress(),
        const SizedBox(height: 10),
        // Tiempo inicial
        Text(
          musicPlayerProvider.songCurrentDurationFormated,
          style: TextStyle(color: colorTextDuration),
        ),
      ],
    );
  }
}

// Widget encargado de dibujar la barra de progreso de la pista musical
class _Progress extends StatelessWidget {
  const _Progress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Requerir la instancia de mi Provider
    final musicPlayerProvider = Provider.of<MusicPlayerProvider>(context);

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        // Barra de fondo
        Container(
          width: 3,
          height: 200,
          color: Colors.white.withOpacity(0.1),
        ),
        // Barra que indica el progreso actual
        Container(
          width: 3,
          height: 230 * musicPlayerProvider.percentage,
          color: Colors.white.withOpacity(0.8),
        ),
      ],
    );
  }
}

// Widget privado que hace referencia al disco compacto que se usa como portada
class _CompactDisc extends StatelessWidget {
  const _CompactDisc({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Requerir la instancia de MusicPlayerProvider
    final musicPlayerProvider = Provider.of<MusicPlayerProvider>(context);

    // Animar de forma infinita la imagen del disco (paquete Animate_do)
    return SpinPerfect(
      // duración o velocidad de la animación
      duration: const Duration(seconds: 10),
      // animación infinitsa
      infinite: true,
      // esta animación se activará o pausará manualmente (dependiendo si el usuario toca el botón de reproducir)
      manualTrigger: true,
      // función que expone el controlador de esta animación
      // ? se comparte la referencia del controlador de animación usado en el SpinPerfect hacia musicPlayerProvider
      // * Al compartir esa referencia podemos manipular (activar o parar) esta animación, desde otras partes de la aplicación (botón de play o pausa)
      controller: (animationController) =>
          musicPlayerProvider.controller = animationController,
      child: const Image(
        image: AssetImage('assets/images/brillantes_de_la_cumbia.jpg'),
      ),
    );
  }
}
