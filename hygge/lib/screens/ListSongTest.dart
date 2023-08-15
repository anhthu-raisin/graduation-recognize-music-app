import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:hygge/screens/play_music.dart';

// import '../config/colors.dart';

class ListSong extends StatefulWidget {
  const ListSong({super.key});

  @override
  State<ListSong> createState() => _ListSongState();
}

class _ListSongState extends State<ListSong> {
  String lyricSearch = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: bgColor,
        title: Card(
          child: TextField(
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search), hintText: 'Search...'),
              onChanged: (val) {
                setState(() {
                  lyricSearch = val;
                });
              }),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('songs').snapshots(),
        builder: (context, snapshots) {
          return (snapshots.connectionState == ConnectionState.waiting)
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: snapshots.data!.docs.length,
                  itemBuilder: (context, index) {
                    var data = snapshots.data!.docs[index].data()
                        as Map<String, dynamic>;

                    if (data['lyric']
                            .toString()
                            .toLowerCase()
                            .contains(lyricSearch.toLowerCase().trim()) ||
                        lyricSearch.isEmpty) {
                      return Card(
                        child: GestureDetector(
                          child: ListTile(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => PlayMusic(
                              //             songData: data,
                              //           )),
                              // );
                            },
                            title: Text(
                              data['title'],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  color: Colors.black54,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              data['audio'],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  color: Colors.black54,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      );
                    }

                    return Container();
                  },
                );
        },
      ),
    );
  }
}
