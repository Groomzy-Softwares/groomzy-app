import 'package:flutter/material.dart';

class AndroidSort extends StatelessWidget {
  const AndroidSort({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: Icon(
          Icons.sort_outlined,
          size: 40,
          color: Theme.of(context).primaryColor,
        ),
        onPressed: () {},
      ),
    );
  }
}