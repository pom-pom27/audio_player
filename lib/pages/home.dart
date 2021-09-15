import 'package:flutter/material.dart';
import 'package:streaming_audio_flutter_demo/page_manager_song.dart';
import 'package:streaming_audio_flutter_demo/pages/radio.dart';
import 'package:streaming_audio_flutter_demo/pages/song_page.dart';

import '../page_manager_radio.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;

  late final PageManagerRadio _pageManagerRadio;
  late final PageManagerSong _pageManagerSong;

  @override
  void initState() {
    super.initState();
    _pageManagerRadio = PageManagerRadio();
    _pageManagerSong = PageManagerSong();
  }

  @override
  void dispose() {
    _pageManagerRadio.dispose();
    _pageManagerSong.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final list = [
      SongPage(pageManager: _pageManagerSong),
      RadioPage(pageManager: _pageManagerRadio),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: list.elementAt(index),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (idx) {
          setState(() {
            index = idx;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.music_note), label: 'Song'),
          BottomNavigationBarItem(icon: Icon(Icons.radio), label: 'Radio'),
        ],
      ),
    );
  }
}
