import 'package:emdictionary/locator.dart';
import 'package:emdictionary/services/text_to_speech.dart';

import '../base_view_model.dart';

class DefinitionViewModel extends BaseViewModel {
  final ttsService = locator<TtsService>();

  void speak({String word}) async {
    await ttsService.speak(word: word);
  }
}
