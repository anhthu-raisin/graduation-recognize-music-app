import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hygge/screens/DetectPage.dart';
import 'package:hygge/screens/ListViewPage.dart';

// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:hygge/screens/PlayMusicPage.dart';
import 'package:hygge/screens/ListSongTest.dart';
import 'package:hygge/tests/AddSong.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        // "/": (context) => AddSong(),
        "/": (context) => const DetectPage(),
        // "/": (context) => const ListSong(),
        // "playMusicPage": (context) => const PlayMusicPage(),
      },
    );
  }
}
