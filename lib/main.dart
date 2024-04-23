import 'package:flutter/material.dart';
import 'package:music_player_flutter_app/screens/player_screen.dart';
import 'package:music_player_flutter_app/theme/theme.dart';

void main() => runApp(const MusicPlayerApp());

class MusicPlayerApp extends StatelessWidget {
  const MusicPlayerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Music Player App',
      theme: musicPlayerTheme,
      home: const PlayerScreen(),
    );
  }
}
