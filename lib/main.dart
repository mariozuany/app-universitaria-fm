import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

final assetsAudioPlayer = AssetsAudioPlayer();

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('My Radio App'),
          ),
          body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RaisedButton(
                    onPressed: () => _playAudio(),
                    child: Text('Tocar'),
                  ),
                  RaisedButton(
                    onPressed: () => _stopAudio(),
                    child: Text('Parar'),
                  )
                ]),
          )),
    ),
  );
}

_playAudio() {
  assetsAudioPlayer.open(
    Audio.liveStream(
      'http://5r76z.srv27.brasilstream.com.br:8642/stream?identifica=8595403666198521000',
      metas: Metas(
        title: "Online",
        artist: "Florent Champigny",
        album: "OnlineAlbum",
        image: MetasImage.network(
            "https://image.shutterstock.com/image-vector/pop-music-text-art-colorful-600w-515538502.jpg"),
      ),
    ),
    showNotification: true,
    notificationSettings: NotificationSettings(
        nextEnabled: true, prevEnabled: true, seekBarEnabled: false),
  );
  assetsAudioPlayer.play();
}

_stopAudio() {
  assetsAudioPlayer.stop();
}
