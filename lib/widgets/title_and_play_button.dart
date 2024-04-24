import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:music_player_flutter_app/providers/music_player_provider.dart';
import 'package:provider/provider.dart';

// Widget contenedor encargado de mostrar el título de la canción, nombre del artista y el botón de reproducit
class TitleAndPlayButton extends StatelessWidget {
  const TitleAndPlayButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      margin: const EdgeInsets.only(bottom: 20),
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
// ? Se transforma a un widget con estado ya que se animará el botón de reproducir, el cuál mostrará un icono diferente dependiendo si el usuario reproduce o pausa la pista musicol
class _PlayButton extends StatefulWidget {
  const _PlayButton({
    super.key,
  });

  @override
  State<_PlayButton> createState() => _PlayButtonState();
}

// ? SingleTickerProviderStateMixin es una clase de mixin en Flutter que proporciona un TickerProvider para un único AnimationController.
// Un TickerProvider es necesario cuando estás utilizando animaciones en Flutter, ya que los objetos AnimationController requieren un Ticker para funcionar.
// * Cuando utilizas una animación con un AnimationController, necesitas proporcionar un objeto que implemente TickerProvider. Este objeto se utiliza para generar los pulsos de reloj necesarios para actualizar la animación en cada fotograma.
class _PlayButtonState extends State<_PlayButton>
    with SingleTickerProviderStateMixin {
  // Propiedad de estado para saber si la pista musical se esta reproduciendo
  bool isPlaying = false;
  // Bandera para saber si la pista de audio seleccionada aun no se reproducido por primera vez
  bool isNewTrack = true;
  // Controlador de animación
  late AnimationController animationController;
  // Instancia del reproductor de audio
  final AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();

  @override
  void initState() {
    // Inicializar el controlador de animación (se puede utilizar para iniciar, deterner, avanzar o retorceder una animación)
    animationController = AnimationController(
      // especifica el objeto que implementa TickerProvider y se utiliza para proporcionar los pulsos de reloj necesarios para la animación. (este objeto)
      vsync: this,
      // duración de la animación
      duration: const Duration(milliseconds: 500),
    );
    super.initState();
  }

  @override
  void dispose() {
    // Eliminar cualquier controlador antes de destruir esta pantalla del árbol de widgets
    animationController.dispose();
    super.dispose();
  }

  // Método que establece la pista de audio a reproducir y obtiene metainformación de la misma
  void open() {
    // Setear pista de audio y reproducirla
    final musicPlayerProvider =
        Provider.of<MusicPlayerProvider>(context, listen: false);
    assetsAudioPlayer.open(Audio('assets/audio/es_el_amor.mp3'));

    // Obtener la duración total
    assetsAudioPlayer.current.listen((Playing? playingAudio) {
      musicPlayerProvider.songTotalDuration =
          playingAudio?.audio.duration ?? const Duration(seconds: 0);
    });

    // Obtener la posición actual de reproducción
    assetsAudioPlayer.currentPosition.listen((duration) {
      musicPlayerProvider.songCurrentDuration = duration;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Requerir la instancia de MusicPlayerProvider
    final musicPlayerProvider = Provider.of<MusicPlayerProvider>(context);

    return FloatingActionButton(
      // Controlar elevación visual del botón flotante y su sombra (cuando es presionado)
      elevation: 0,
      highlightElevation: 0,
      backgroundColor: const Color(0xfff8cb51),
      onPressed: () {
        // Si se esta reproduciendo, regresar el icono a su estado anterior, caso contrario avanzar al siguiente icono
        // ? (la transición entre uno y otro es gestionada por el controlador de aniumación)
        if (isPlaying) {
          animationController.reverse();
          isPlaying = false;
          // ! Indicar a la animación de la portada del disco (SpinPerfect) que debe parar
          // Esto es posible debido a que MusicPlayerProvider tiene la referencia al controlador de animación del SpinPerfect
          musicPlayerProvider.controller.stop();
        } else {
          animationController.forward();
          isPlaying = true;
          // ! Indicar a la animación de la portada del disco (SpinPerfect) que debe ejecutar nuevamente la animación
          // Esto es posible debido a que MusicPlayerProvider tiene la referencia al controlador de animación del SpinPerfect
          musicPlayerProvider.controller.repeat();
        }

        // Si la pista aun no se ha reproducido, setaala y reproduce
        if (isNewTrack) {
          open();
          isNewTrack = false;
        } else {
          // Pausa o reproduce la pista seteada
          assetsAudioPlayer.playOrPause();
        }

        setState(() {});
      },
      // AnimatedIcon es un widget utilizado para mostrar un icono animado.
      child: AnimatedIcon(
        // El icono animado a mostrar en el botón
        // ? Son iconos especiales preparados para la animación
        icon: AnimatedIcons.play_pause,
        // El controlador de la animación
        progress: animationController,
      ),
    );
  }
}
