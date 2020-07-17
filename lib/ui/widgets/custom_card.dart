import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final int id;
  final String title;
  final String subtitle;

  final Function() onPressed;
  final Function() speakOnPressed;

  const CustomCard({
    Key key,
    this.id,
    this.title,
    this.subtitle,
    this.onPressed,
    this.speakOnPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: <Widget>[
          ListTile(
            title: Text(title ?? ''),
            subtitle: Text(
              subtitle ?? '',
              maxLines: 1,
            ),
            onTap: onPressed,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.volume_up),
                onPressed: speakOnPressed,
              ),
            ],
          )
        ],
      ),
    );
  }
}
