import 'package:flutter/material.dart';

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
              const Image(
                image: AssetImage('assets/images/brillantes_de_la_cumbia.jpg'),
              ),
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
    // Variable local para almacenar el color del texto referente a la duración
    final colorTextDuration = Colors.white.withOpacity(0.4);
    return Column(
      children: [
        // Duración total de la pista musical
        Text(
          '03:55',
          style: TextStyle(color: colorTextDuration),
        ),
        const SizedBox(height: 10),
        // Barra de progreso
        const _Progress(),
        const SizedBox(height: 10),
        // Tiempo inicial
        Text(
          '00:00',
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
          height: 75,
          color: Colors.white.withOpacity(0.8),
        ),
      ],
    );
  }
}
