import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final Function(String text) onChange;

  const SearchBox({
    Key key,
    this.textEditingController,
    this.hintText,
    this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Stack(
        alignment: Alignment.centerRight,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              fillColor: Theme.of(context).inputDecorationTheme.fillColor,
              hintText: hintText,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.lightBlue),
              ),
            ),
            controller: textEditingController,
            onChanged: onChange,
          ),
          IconButton(
            icon: Icon(Icons.clear),
            onPressed: textEditingController.clear,
          ),
        ],
      ),
    );
  }
}
