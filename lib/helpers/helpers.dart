// ? Los Helpers son funciones o clases declaradas de forma global en la aplicación
// Ayudan a simplificar tareas comunes o repetitivas dentro de un programa.

// Helper que obtiene una lista que corresponde a la letra de una canción (Lirica)
List<String> getLyrics() {
  return [
    'Hope stopped the heart',
    'Lost beaten lie',
    'Cold walk the earth',
    'Love faded white',
    'Gave up the war',
    'I\'ve realized',
    'All will become',
    'All will arise',
    'Stay with me',
    'I hear them call the tide',
    'Take me in',
    'I see the last divide',
    'Hopelessy',
    'I leave this all behind',
    'And I am paralyzed',
    'When the broken fall alive',
    'Let the light take me too',
    'When the waters turn to fire',
    'Heaven, please let me through',
    'Far away, far away',
    'Sorrow has left me here',
    'Far away, far away',
    'Let the light take me in',
    'Fight back the flood',
    'One breath of life',
    'God, take the earth',
    'Forever blind',
    'And now the sun will fade',
    'And all we are is all we made',
    'Stay with me',
    'I hear them call the tide',
    'Take me in',
    'I see the last divide',
    'Hopelessy',
    'I leave this all behind',
    'And I am paralyzed',
    'When the broken fall alive',
    'Let the light take me too',
    'When the waters…'
  ];
}

// Función de utilidad para colocar una mascara de dos digitos en los minutos y segundos al tiempo o duración pasado como parámetro
String maskDuration(Duration duration) {
  // Función inerna que determinar si el número o digito actual se debe prefijar con un cero al inicio
  // Siempre retorna una cadena con dos digitos
  String twoDigits(int number) {
    if (number >= 10) return '$number';
    return '0$number';
  }

  // Calcular los minutoy los convierte a una cadena de dos digitos
  // ? duration.inMinutes.remainder(60) obtiene los minutos restantes después de dividir por 60, lo que asegura que los minutos estén en el rango de 0 a 59.
  String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
  // Calcular los segundos los convierte a una cadena de dos digitos
  // ? duration.inSeconds.remainder(60) obtiene los segundos restantes después de dividir por 60, lo que asegura que los segundos estén en el rango de 0 a 59.
  String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));

  // Retornar el timpo o duración formateada con los minutos y segundos concatenados separados por : puntos
  return '$twoDigitMinutes:$twoDigitSeconds';
}
