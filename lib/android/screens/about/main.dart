import 'package:flutter/material.dart';

import './about.dart';
import '../../app_bar/app_bar.dart';
import '../../drawer/drawer.dart';
import '../../widgets/center/screen_center.dart';
import '../../../common/constants/constants.dart';

class AboutScreen extends StatelessWidget {
  static final String routeName = '/${ABOUT_TITLE.toLowerCase()}';

  const AboutScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AndroidAppBar(title: ABOUT_TITLE,),
      drawer: AndroidDrawer(),
      body: SafeArea(
        child: ScreenCenter(screenContent: About(),),
      ),
    );
  }
}