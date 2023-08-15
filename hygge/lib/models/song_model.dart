import 'package:cloud_firestore/cloud_firestore.dart';

class HyggeSongModel {
  final String title;
  final String audio;
  final String artist;
  final String image;

  HyggeSongModel({
    required this.title,
    required this.audio,
    required this.artist,
    required this.image,
  });

  factory HyggeSongModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return HyggeSongModel(
      title: data?['title'],
      audio: data?['audio'],
      artist: data?['artist'],
      image: data?['image'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (audio != null) "audio": audio,
      if (title != null) "title": title,
      if (artist != null) "artist": artist,
      if (image != null) "image": image,
    };
  }
}
