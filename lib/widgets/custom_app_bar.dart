import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Widget que representa una barra de aplciaciónes personalizada
class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    // Colocar este widget personalizado dentro de un área segura de la pantalla del dispositivo
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top: 16),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: const Row(
          children: [
            Icon(FontAwesomeIcons.chevronLeft, size: 20),
            // Spacer es un widget flexible que se utiliza para ocupar el espacio disponible dentro de un Row o Column.
            // Su principal función es distribuir el espacio disponible de manera uniforme o según las restricciones proporcionadas.
            Spacer(),
            Icon(FontAwesomeIcons.message, size: 20),
            SizedBox(width: 16),
            Icon(FontAwesomeIcons.headphonesSimple, size: 20),
            SizedBox(width: 16),
            Icon(FontAwesomeIcons.arrowUpRightFromSquare, size: 20),
          ],
        ),
      ),
    );
  }
}
