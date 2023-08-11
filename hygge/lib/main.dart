import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hygge/screens/detect_screen.dart';
import 'package:hygge/screens/listview_screen.dart';

// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';

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
  int currentIndex = 0;

  List tabs = [
    const DetectPage(),
    const ListViewPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Music Player App",
      home: Scaffold(
        body: tabs[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          fixedColor: const Color(0xff00A67E),
          currentIndex: currentIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.audiotrack),
              label: "Music",
            )
          ],
          onTap: (index) {
            setState(
              () {
                currentIndex = index;
              },
            );
          },
        ),
      ),
    );
  }
}
