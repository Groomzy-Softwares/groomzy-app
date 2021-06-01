import 'package:flutter/material.dart';

import '../text_field/text_field.dart';

class AndroidSearch extends StatelessWidget {
  const AndroidSearch({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.0,
      width: MediaQuery.of(context).size.width * 0.6,
      child: AndroidTextField(
        label: 'Search',
        suffixIcon: Icons.search_outlined,
        borderRadius: 50,
      ),
    );
  }
}
