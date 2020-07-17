import 'package:flutter/material.dart';

class CustomListView<T> extends StatelessWidget {
  final List<T> items;
  final Widget Function(T item) widget;

  const CustomListView({Key key, this.items, this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) => widget(items[index]),
    );
  }
}
