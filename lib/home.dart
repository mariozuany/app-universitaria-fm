import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

AudioPlayer audioPlayer = AudioPlayer();
int result;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.purple.shade900,
        body: Center(
          child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              StreamBuilder (
                initialData: null,
                stream: audioPlayer.onPlayerStateChanged,
                builder: (context, snapshot) {
                  if (snapshot.data == AudioPlayerState.PLAYING) {
                    return RawMaterialButton(
                      padding: EdgeInsets.all(25.0),
                      shape: CircleBorder(),
                      onPressed: () => _stopAudio(),
                      elevation: 10,
                      fillColor: Colors.deepPurple,
                      child: Icon(
                        Icons.pause,
                        size: 35.0,
                        color: Colors.white,
                      ),
                    );
                  } else {
                    return RawMaterialButton(
                      onPressed: () => _playAudio(),
                      padding: EdgeInsets.all(25.0),
                      shape: CircleBorder(),
                      elevation: 10,
                      fillColor: Colors.deepPurple,
                      child: Icon(
                        Icons.play_arrow,
                        size: 35.0,
                        color: Colors.white,
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ));
  }
}

_stopAudio() async {
  result = await audioPlayer.stop();
}

_playAudio() async {
  result = await audioPlayer.play("http://5r76z.srv27.brasilstream.com.br:8642/stream?identifica=8595403666198521000");
}