import 'package:flutter/material.dart';

import './signup.dart';
import '../../app_bar/app_bar.dart';
import '../../drawer/drawer.dart';
import '../../widgets/center/screen_center.dart';
import '../../../common/constants/constants.dart';

class SignUpScreen extends StatelessWidget {
  static final String routeName = '/${SIGNUP_TITLE.toLowerCase()}';

  const SignUpScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AndroidAppBar(title: SIGNUP_TITLE,),
      drawer: AndroidDrawer(),
      body: SafeArea(
        child: ScreenCenter(screenContent: SignUp(),),
      ),
    );
  }
}