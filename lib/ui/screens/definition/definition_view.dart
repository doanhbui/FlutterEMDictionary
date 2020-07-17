import 'package:emdictionary/ui/screens/definition/widgets/custom_definition_card.dart';
import 'package:emdictionary/ui/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

import '../../../core/definition/definition_view_model.dart';
import '../../../models/definition.dart';
import '../base_view.dart';

class DefinitionView extends StatelessWidget {
  final Definition definition;

  const DefinitionView({Key key, this.definition}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<DefinitionViewModel>(
      model: DefinitionViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: CustomAppBar(
          title: definition.word,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.volume_up),
              onPressed: () => model.speak(word: definition.word),
            ),
          ],
        ),
        body: CustomDefinitionCard(
          word: definition.word,
          engDefinition: definition.englishDefinition ?? '',
          mymDefinition: definition.myanmarDefinition ?? '',
        ),
      ),
    );
  }
}
