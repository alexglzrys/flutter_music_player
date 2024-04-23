import 'package:flutter/material.dart';

// Clase de tipo Provider que maneja el estado de la reproducción del audio
class MusicPlayerProvider extends ChangeNotifier {
  // Exponer un controlador para la animación de rotación de la portada (disco compacto)
  late AnimationController _controller;

  // Getters y Setters
  AnimationController get controller => _controller;

  set controller(AnimationController newController) {
    _controller = newController;
  }
}
