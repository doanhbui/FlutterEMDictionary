import 'dart:async';

import 'package:flutter/cupertino.dart';

import '../../constants/route_names.dart';
import '../../locator.dart';
import '../../models/definition.dart';
import '../../services/database_service.dart';
import '../../services/navigation_service.dart';
import '../../services/text_to_speech.dart';
import '../base_view_model.dart';
import '../repositories/dictionary_repository.dart';

const duration = Duration(milliseconds: 500);

class HomeViewModel extends BaseViewModel {
  final databaseService = locator<DatabaseService>();
  final dictionaryRepository = locator<DictionaryRepository>();
  final navigationService = locator<NavigationService>();
  final ttsService = locator<TtsService>();

  final textEditingController = TextEditingController();

  List<Definition> _definitions = [];
  List<Definition> get definitions => _definitions;

  Timer _searchTimer;

  // SearchBox
  void onTextChanged(String text) {
    _searchTimer?.cancel();
    _searchTimer = Timer(duration, () => _searchDefinition(text));
  }

  void _searchDefinition(String text) async {
    if (text.isEmpty) return;
    setBusy(true);
    _definitions = await dictionaryRepository.searchDefinition(text: text);
    setBusy(false);
  }

  void navigateToDefinition(Definition item) async {
    navigationService.navigateTo(DefinitionViewRoute, arguments: item);
  }

  void speak({String word}) async {
    await ttsService.speak(word: word);
  }
}
