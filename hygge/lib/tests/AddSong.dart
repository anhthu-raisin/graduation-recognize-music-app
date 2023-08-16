import 'package:flutter/material.dart';
import 'package:hygge/models/song_service.dart';

class AddSong extends StatelessWidget {
  final SongService song = SongService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: song.addSongToDB,
          child: Text("Press me"),
        ),
      ),
    );
  }
}
