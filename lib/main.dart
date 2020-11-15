import 'package:flutter/material.dart';
import 'package:flutter_radio_player/flutter_radio_player.dart';

FlutterRadioPlayer _flutterRadioPlayer = new FlutterRadioPlayer();

void main() {
  runApp(
    MaterialApp(
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
                  RaisedButton(
                    onPressed: () => _playOrPauseAudio(),
                    child: Text('Tocar'),
                  ),
                  StreamBuilder<String>(
                      initialData: "xxx",
                      stream: _flutterRadioPlayer.metaDataStream,
                      builder: (context, snapshot) {
                        print(snapshot);
                        return Text(snapshot.data);
                      }),
                ],),
          )),
    ),
  );
  _openAudioPlayer();
}

_openAudioPlayer() async {
  await _flutterRadioPlayer.init("Flutter Radio Example", "Live", "http://5r76z.srv27.brasilstream.com.br:8642/stream?identifica=8595403666198521000", "false");
}

_playOrPauseAudio() async {
  await _flutterRadioPlayer.playOrPause();
}
