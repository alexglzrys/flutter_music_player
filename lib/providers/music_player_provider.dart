import 'package:flutter/material.dart';
import 'package:music_player_flutter_app/helpers/helpers.dart';

// Clase de tipo Provider que maneja el estado de la reproducción del audio
class MusicPlayerProvider extends ChangeNotifier {
  // Exponer un controlador para la animación de rotación de la portada (disco compacto)
  late AnimationController _controller;
  // Bandera que determina si el audio esta en modo reproducción o pausado
  bool _playing = false;
  // Duración total de la pista de audio seleccionada
  Duration _songTotalDuration = const Duration(seconds: 0);
  // Duración reproducida hasta el momento
  Duration _songCurrentDuration = const Duration(seconds: 0);

  // Getters y Setters - Controlador de animación
  AnimationController get controller => _controller;
  set controller(AnimationController newController) {
    _controller = newController;
  }

  // Getters y Setters - ¿El audio se esta reproduciendo?
  bool get playing => _playing;
  set playing(bool newValue) {
    _playing = newValue;
    notifyListeners();
  }

  // Getters y Setters - Duración total de la pista de audio
  Duration get songTotalDuration => _songTotalDuration;
  set songTotalDuration(Duration newDuration) {
    _songTotalDuration = newDuration;
    notifyListeners();
  }

  // Getters y Setters - Duración actual o momento actual de la pista de audio
  Duration get songCurrentDuration => _songCurrentDuration;
  set songCurrentDuration(Duration newDuration) {
    _songCurrentDuration = newDuration;
    notifyListeners();
  }

  // Geeters para obtener la duración total de la pista de audio y el momento actual de reproducción formateadas a mm:ss
  String get songTotalDurationFormated => maskDuration(_songTotalDuration);
  String get songCurrentDurationFormated => maskDuration(_songCurrentDuration);

  // Getter para obtener el porcentaje actual de reproducción
  // Evitar división entre cero
  double get percentage => (_songTotalDuration.inSeconds > 0)
      ? (_songCurrentDuration.inSeconds / _songTotalDuration.inSeconds)
      : 0;
}
