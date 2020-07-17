import 'package:flutter/material.dart';

import '../../../../constants/text.dart';

class CustomDefinitionCard extends StatelessWidget {
  final String word;
  final String mymDefinition;
  final String engDefinition;

  const CustomDefinitionCard({
    Key key,
    this.word,
    this.mymDefinition,
    this.engDefinition,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Scrollbar(
            child: ListView(
              children: <Widget>[
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      word,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                ),
                Text(
                  myanmarTitle,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                const Divider(thickness: 2.0),
                Text(mymDefinition),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  englishTitle,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                const Divider(thickness: 2.0),
                Text(engDefinition)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
