import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:hygge/models/song_model.dart';

class SongService {
  FirebaseFirestore db = FirebaseFirestore.instance;

  SongService();

  Future<HyggeSongModel?> getTrack(id) async {
    final ref = db.collection("songs").doc(id).withConverter(
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

  Future<void> addSongToDB() async {
    var addSongs = [
      [
        "There's Nothing Holdin' Me Back",
        "Shawn Mendes",
        "https://firebasestorage.googleapis.com/v0/b/music-app-8ed69.appspot.com/o/Shawn%20Mendes%20-%20There%20s%20Nothing%20Holdin%20%20Me%20Back%20(Official%20Music%20Video).mp3?alt=media&token=f811cba7-d531-4723-90e6-0d140a4b4e1a",
        "https://avatar-ex-swe.nixcdn.com/song/2017/09/14/c/5/1/7/1505351643722_640.jpg",
        "369230121"
      ],
      [
        "My Favourite Clothes",
        "RINI",
        "https://firebasestorage.googleapis.com/v0/b/music-app-8ed69.appspot.com/o/RINI%20%E2%80%93%20My%20Favourite%20Clothes.mp3?alt=media&token=868cfc8c-5d8e-402d-82e0-3af477306991",
        "https://i.pinimg.com/736x/0d/95/04/0d95040920a44f9dbf594b52b25fba2e.jpg",
        "446689982"
      ],
      [
        "Shouldn't Be",
        "Luke Chiang",
        "https://firebasestorage.googleapis.com/v0/b/music-app-8ed69.appspot.com/o/Shouldn%20t%20Be.mp3?alt=media&token=b5d2bf14-965c-4dab-ac60-4b14df139485",
        "https://cdns-images.dzcdn.net/images/artist/9f727d8ef31781ed67fea4856f464ee8/500x500.jpg",
        '668684592'
      ],
      [
        "Flower",
        "Jonny Stimson",
        "https://firebasestorage.googleapis.com/v0/b/music-app-8ed69.appspot.com/o/Johnny%20Stimson%20-%20Flower%20(Official%20Lyric%20Video).mp3?alt=media&token=7092cc18-7474-4024-9e07-9f558c0badb6",
        "https://i.scdn.co/image/ab67616d0000b273d080007dee6d6d60e859f7bc",
        "656373932",
      ],
      [
        "Just Say Hello",
        "MELO－D",
        "https://firebasestorage.googleapis.com/v0/b/music-app-8ed69.appspot.com/o/Just%20Say%20Hello%20-%20Melo%20D%20(Official%20Lyric%20Video).mp3?alt=media&token=889d3c24-4f85-4f4b-a53c-e190b23f61b5",
        "https://avatar-ex-swe.nixcdn.com/song/2023/06/12/f/8/e/b/1686553158756_640.jpg",
        "1747635847",
      ],
      [
        "double take",
        "dhruv",
        "https://firebasestorage.googleapis.com/v0/b/music-app-8ed69.appspot.com/o/dhruv%20-%20double%20take%20(Official%20Audio).mp3?alt=media&token=707e2d55-1dfa-450a-93c7-62f8c06538bd",
        "https://i.scdn.co/image/ab67616d0000b273834f16100678d3e800fb5fb9",
        "1095011942",
      ],
      [
        "With You",
        "Mokita",
        "https://firebasestorage.googleapis.com/v0/b/music-app-8ed69.appspot.com/o/Mokita%20-%20With%20You%20(Lyrics).mp3?alt=media&token=f3131124-f472-4a47-b041-746dff788ab9",
        "https://images.genius.com/e4b735a0f3552978f7a53fe1af521c1a.1000x1000x1.png",
        "567603352",
      ],
      [
        "moonlight",
        "dhruv",
        "https://firebasestorage.googleapis.com/v0/b/music-app-8ed69.appspot.com/o/dhruv%20-%20moonlight%20(Official%20Audio).mp3?alt=media&token=45624339-cd52-4eac-8d91-11a462455014",
        "https://i1.sndcdn.com/artworks-eafw5e4QDCd7-0-t500x500.jpg",
        "1532325062",
      ],
      [
        "Butterflies",
        "Johnny Stimson",
        "https://firebasestorage.googleapis.com/v0/b/music-app-8ed69.appspot.com/o/Johnny%20Stimson%20-%20Butterflies%20(Official%20Lyric%20Video).mp3?alt=media&token=51fd7a93-8890-4f87-9c07-fdcc816fcacc",
        "https://i1.sndcdn.com/artworks-auAbim0g5iu8vegn-BUyHsQ-t500x500.jpg",
        "1169055462",
      ],
      [
        "Time",
        "Dane Amar",
        "https://firebasestorage.googleapis.com/v0/b/music-app-8ed69.appspot.com/o/Time%20-%20Dane%20Amar%20(Lyrics).mp3?alt=media&token=15727e9d-de18-4745-b6ca-71569cd789d7",
        "https://i.kfs.io/album/global/71048611,0v1/fit/500x500.jpg",
        "902345152",
      ],
      [
        "Ride",
        "HYBS",
        "https://firebasestorage.googleapis.com/v0/b/music-app-8ed69.appspot.com/o/HYBS%20-%20Ride%20(Official%20Video).mp3?alt=media&token=79f50b73-aa2a-4b15-b1e8-8f31e6e2496b",
        "https://images.genius.com/adaf6a47e77b94822999125057727ce1.1000x1000x1.jpg",
        "1492570602",
      ],
      [
        "I.F.L.Y.",
        "Bazzi",
        "https://firebasestorage.googleapis.com/v0/b/music-app-8ed69.appspot.com/o/Bazzi%20-%20I.F.L.Y.%20%5BOfficial%20Music%20Video%5D.mp3?alt=media&token=cd4620a3-af25-40ad-805e-388b53162d75",
        "https://upload.wikimedia.org/wikipedia/en/c/c7/I.F.L.Y._by_Bazzi.png",
        "712370562",
      ],
      [
        "LIMBO",
        "keshi",
        "https://firebasestorage.googleapis.com/v0/b/music-app-8ed69.appspot.com/o/keshi%20-%20LIMBO%20(Lyric%20Video).mp3?alt=media&token=9cc3e06f-9d2e-460a-b109-4387a7a8b9e2",
        "https://images.genius.com/d0a6a31899d8213a241b318423e8c331.400x400x1.jpg",
        "1689965077",
      ],
      [
        "Cheating on You",
        "Charlie Puth",
        "https://firebasestorage.googleapis.com/v0/b/music-app-8ed69.appspot.com/o/Charlie%20Puth%20-%20Cheating%20on%20You%20(Lyrics).mp3?alt=media&token=b1b8d9f8-1bc9-455c-bb18-6c906690b802",
        "https://avatar-ex-swe.nixcdn.com/song/2019/10/02/3/1/4/d/1569984438830_640.jpg",
        "764706602",
      ],
      [
        "lowkey",
        "NIKI",
        "https://firebasestorage.googleapis.com/v0/b/music-app-8ed69.appspot.com/o/NIKI%20-%20lowkey%20(Lyrics).mp3?alt=media&token=3f175c1f-ae24-4d9c-8024-0985794297a4",
        "https://i.scdn.co/image/ab67616d0000b273135a78be90223c126a4e2c36",
        "669008232",
      ],
      // [
      //   "Angel By The Wings",
      //   "Sia",
      //   "https://firebasestorage.googleapis.com/v0/b/music-app-8ed69.appspot.com/o/Angel-By-The-Wings-Sia.mp3?alt=media&token=8d1ca185-1417-4862-943a-b66708c24488",
      //   "https://upload.wikimedia.org/wikipedia/en/a/a2/Angel_by_the_Wings_by_Sia.jpg",
      //   "",
      // ],
      // [
      //   "Big Girls Cry",
      //   "Sia",
      //   "https://firebasestorage.googleapis.com/v0/b/music-app-8ed69.appspot.com/o/Big-Girls-Cry-Sia.mp3?alt=media&token=4d5c66ac-a880-4533-a353-2b85e9db6327",
      //   "https://www.quotev.com/quizi/12634715/3/1665901143",
      //   "",
      // ],
      // [
      //   "Chandelier",
      //   "Sia",
      //   "https://firebasestorage.googleapis.com/v0/b/music-app-8ed69.appspot.com/o/Chandelier-Sia.mp3?alt=media&token=ee255c35-7d63-48fe-b3e1-c6d0fbbadad7",
      //   "https://i1.sndcdn.com/artworks-000115725245-bsa5pw-t500x500.jpg",
      //   "",
      // ],
      // [
      //   "I like me better",
      //   "Lauv",
      //   "https://firebasestorage.googleapis.com/v0/b/music-app-8ed69.appspot.com/o/I-Like-Me-Better-Lauv.mp3?alt=media&token=07fad55e-9717-4de6-a18c-305602240ea5",
      //   "https://i1.sndcdn.com/artworks-000239465971-hnu0g4-t500x500.jpg",
      //   "",
      // ],
    ];

    for (var song in addSongs) {
      final newSong = HyggeSongModel(
        title: song[0],
        artist: song[1],
        audio: song[2],
        image: song[3],
      );
      final docRef = db
          .collection("songs")
          .withConverter(
            fromFirestore: HyggeSongModel.fromFirestore,
            toFirestore: (HyggeSongModel city, options) => city.toFirestore(),
          )
          .doc(song[4]);
      await docRef.set(newSong);
    }

    return;
  }
}
