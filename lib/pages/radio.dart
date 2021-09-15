import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';

import '../page_manager_radio.dart';

class RadioPage extends StatelessWidget {
  const RadioPage({
    Key? key,
    required PageManagerRadio pageManager,
  })  : _pageManagerRadio = pageManager,
        super(key: key);

  final PageManagerRadio _pageManagerRadio;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Spacer(),
            Card(
              // height: 80,
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.circular(8),
              //   color: Colors.lightBlue.shade100,
              // ),
              child: Row(
                children: [
                  ValueListenableBuilder<ButtonState>(
                    valueListenable: _pageManagerRadio.buttonNotifier,
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
                            onPressed: _pageManagerRadio.play,
                          );
                        case ButtonState.playing:
                          return IconButton(
                            icon: Icon(Icons.pause),
                            iconSize: 32.0,
                            onPressed: _pageManagerRadio.pause,
                          );
                      }
                    },
                  ),
                  Text(
                    'BBC World Service Radio',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            // ValueListenableBuilder<ProgressBarState>(
            //   valueListenable: _pageManagerRadio.progressNotifier,
            //   builder: (_, value, __) {
            //     return ProgressBar(
            //       progress: value.current,
            //       buffered: value.buffered,
            //       total: value.total,
            //       onSeek: _pageManagerRadio.seek,
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
