import 'package:emdictionary/ui/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

import '../../../core/home/home_view_model.dart';
import '../../../models/definition.dart';
import '../../widgets/custom_card.dart';
import '../../widgets/custom_list_view.dart';
import '../../widgets/search_box.dart';
import '../base_view.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      model: HomeViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: CustomAppBar(title: 'EMDictionary'),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            searchBox(model),
            definitionsListView(model),
          ],
        ),
      ),
    );
  }
}

Widget searchBox(HomeViewModel model) {
  return SearchBox(
    textEditingController: model.textEditingController,
    onChange: model.onTextChanged,
  );
}

Widget definitionsListView(HomeViewModel model) {
  if (model.isBusy) {
    return LinearProgressIndicator();
  } else {
    return Expanded(
      child: CustomListView<Definition>(
        items: model.definitions,
        widget: (item) => CustomCard(
          id: item.id,
          title: item.word,
          subtitle: item.myanmarDefinition ?? item.englishDefinition,
          onPressed: () => model.navigateToDefinition(item),
          speakOnPressed: () => model.speak(word: item.word),
        ),
      ),
    );
  }
}
