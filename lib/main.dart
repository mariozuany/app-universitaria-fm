import 'package:flutter/material.dart';
import 'package:flutter_radio_player/flutter_radio_player.dart';

FlutterRadioPlayer _flutterRadioPlayer = new FlutterRadioPlayer();

void main() {
  runApp(
    MyApp()
  );
  _openAudioPlayer();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.purple.shade900,
          appBar: AppBar(
            title: Text('Universitária FM 104.7'),
            backgroundColor: Colors.deepPurple,
          ),
          body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RawMaterialButton(
                    onPressed: () => _playOrPauseAudio(),
                    elevation: 10,
                    fillColor: Colors.deepPurple,
                    child: StreamBuilder (
                        initialData: null,
                        stream: _flutterRadioPlayer.isPlayingStream,
                        builder: (context, snapshot) {
                          print(snapshot);
                          if (snapshot.data == 'flutter_radio_playing') {
                            return Icon(
                              Icons.pause,
                              size: 35.0,
                              color: Colors.white,
                            );
                          }
                          return Icon(
                            Icons.play_arrow,
                            size: 35.0,
                            color: Colors.white,
                          );
                        }),
                    padding: EdgeInsets.all(25.0),
                    shape: CircleBorder(),
                  ),
                ]),
          )),
    );
  }
}

_openAudioPlayer() async {
  await _flutterRadioPlayer.init(
      "Universitária FM 104.7",
      "Ao Vivo",
      "http://5r76z.srv27.brasilstream.com.br:8642/stream?identifica=8595403666198521000",
      "false");
}

_playOrPauseAudio() async {
  await _flutterRadioPlayer.playOrPause();
}