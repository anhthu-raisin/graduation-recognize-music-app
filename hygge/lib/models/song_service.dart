import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:hygge/models/song_model.dart';

class SongService {
  late Dio _dio;

  SongService() {
    BaseOptions options = BaseOptions(
      baseUrl: 'https://api.deezer.com/track/',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    );
    _dio = Dio(options);
  }

  Future<HyggeSongModel?> getTrack(id) async {
    FirebaseFirestore db = FirebaseFirestore.instance;

    final ref = db.collection("songs").doc("1747635847").withConverter(
          fromFirestore: HyggeSongModel.fromFirestore,
          toFirestore: (HyggeSongModel song, _) => song.toFirestore(),
        );

    final docSnap = await ref.get();
    final song = docSnap.data(); // Convert to City object

    if (song != null) {
      print(song);
    } else {
      print("No such document.");
    }
    return song;
  }
}
