import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

class DetectPage extends StatefulWidget {
  const DetectPage({super.key});

  @override
  State<DetectPage> createState() => _DetectPageState();
}

class _DetectPageState extends State<DetectPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 149, 141, 163),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Catch your Music"),
              AvatarGlow(
                animate: true,
                endRadius: 100,
                glowColor: Colors.deepPurple,
                duration: Duration(milliseconds: 2000),
                repeatPauseDuration: Duration(microseconds: 100),
                child: Icon(
                  Icons.music_note,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
