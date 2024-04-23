import 'package:flutter/material.dart';

// Widget que representa la portada y duración de la pista musical
class CoverAndDuration extends StatelessWidget {
  const CoverAndDuration({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 60),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          // Portada
          const _Cover(),
          // Duración
          Container(),
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
