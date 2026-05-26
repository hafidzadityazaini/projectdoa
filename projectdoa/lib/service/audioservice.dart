import 'package:just_audio/just_audio.dart';

class AudioService {
  static final player = AudioPlayer();
  static Future playMurottal() async {
    await player.setUrl(
      'https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/001.mp3',
    );
    player.play();
  }
  static Future stopAudio() async {
    player.stop();
  }
}