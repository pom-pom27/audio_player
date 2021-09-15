import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:streaming_audio_flutter_demo/page_manager_song.dart';

class SongPage extends StatelessWidget {
  const SongPage({
    Key? key,
    required PageManagerSong pageManager,
  })  : _pageManagerSong = pageManager,
        super(key: key);

  final PageManagerSong _pageManagerSong;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Spacer(),
            Text(
              'SoundHelix Song 2',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            SizedBox(
              height: 30,
            ),
            ValueListenableBuilder<ProgressBarState>(
              valueListenable: _pageManagerSong.progressNotifier,
              builder: (_, value, __) {
                return ProgressBar(
                  progress: value.current,
                  buffered: value.buffered,
                  total: value.total,
                  onSeek: _pageManagerSong.seek,
                );
              },
            ),
            ValueListenableBuilder<ButtonState>(
              valueListenable: _pageManagerSong.buttonNotifier,
              builder: (_, value, __) {
                switch (value) {
                  case ButtonState.loading:
                    return Container(
                      margin: EdgeInsets.all(8.0),
                      width: 32.0,
                      height: 32.0,
                      child: CircularProgressIndicator(),
                    );
                  case ButtonState.paused:
                    return IconButton(
                      icon: Icon(Icons.play_arrow),
                      iconSize: 32.0,
                      onPressed: _pageManagerSong.play,
                    );
                  case ButtonState.playing:
                    return IconButton(
                      icon: Icon(Icons.pause),
                      iconSize: 32.0,
                      onPressed: _pageManagerSong.pause,
                    );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
