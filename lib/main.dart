import 'package:flutter/material.dart';
import 'package:music_player_flutter_app/providers/music_player_provider.dart';
import 'package:music_player_flutter_app/screens/player_screen.dart';
import 'package:music_player_flutter_app/theme/theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MusicPlayerApp());

class MusicPlayerApp extends StatelessWidget {
  const MusicPlayerApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Esta aplicación usa Provider para la gestión global del estado
    return MultiProvider(
      providers: [
        // Registrar la instancia de MusicPlayerProvider
        ChangeNotifierProvider(create: (_) => MusicPlayerProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Music Player App',
        theme: musicPlayerTheme,
        home: const PlayerScreen(),
      ),
    );
  }
}
