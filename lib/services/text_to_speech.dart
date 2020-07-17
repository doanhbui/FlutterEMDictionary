import 'package:flutter_tts/flutter_tts.dart';

class TtsService {
  FlutterTts _flutterTts;

  TtsService() : _flutterTts = FlutterTts();

  Future<void> speak({String word}) async {
    // dispose();

    await _flutterTts.speak(word);
  }

  void dispose() {
    _flutterTts.stop();
  }
}
