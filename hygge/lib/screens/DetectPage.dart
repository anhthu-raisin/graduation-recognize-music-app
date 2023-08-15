import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hygge/screens/PlayMusicPage.dart';

import '../viewmodels/home_vm.dart';

class DetectPage extends HookConsumerWidget {
  const DetectPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(homeViewModel);

    ref.listen<HomeViewModel>(homeViewModel,
        (HomeViewModel? oldVm, HomeViewModel newVm) {
      if (newVm.success) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PlayMusicPage(songData: newVm.currentSong),
            ));
      }
    });

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 149, 141, 163),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("ỦA ALO"),
              AvatarGlow(
                animate: vm.isRecognizing,
                endRadius: 75.0,
                duration: const Duration(milliseconds: 2000),
                repeat: true,
                showTwoGlows: true,
                repeatPauseDuration: const Duration(milliseconds: 100),
                child: GestureDetector(
                  onTap: () => vm.isRecognizing
                      ? vm.stopRecognizing()
                      : vm.startRecognizing(),
                  child: const CircleAvatar(
                    radius: 35,
                    child: Icon(
                      Icons.music_note,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
