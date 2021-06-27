import 'package:flutter/material.dart';

class AndroidFilters extends StatelessWidget {
  const AndroidFilters({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: Icon(
          Icons.filter_list_outlined,
          size: 38.0,
          color: Colors.grey,
        ),
        onPressed: () {},
      ),
    );
  }
}
