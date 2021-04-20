import 'package:flutter/material.dart';
import 'package:tic_tac_toe/screens/bot_config_page.dart';
import 'package:tic_tac_toe/screens/friend_config_page.dart';
import 'package:tic_tac_toe/screens/info_page.dart';
import 'package:tic_tac_toe/utils/dimensions.dart';
import 'package:tic_tac_toe/utils/widgets.dart';

class OfflineMenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = Dimensions(context).height;
    final width = Dimensions(context).width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  fullscreenDialog: true, builder: (context) => InfoPage()));
            },
          )
        ],
        backgroundColor: Color(0xFF0B122F),
      ),
      backgroundColor: Color(0xFF0B122F),
      body: SafeArea(
          child: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: height * 0.05,
                  width: double.infinity,
                ),
                Hero(
                  tag: 'logo',
                  child: Image.asset(
                    'assets/icons/logo.png',
                    scale: 3.5,
                  ),
                ),
                SizedBox(
                  height: height * 0.28,
                  width: double.infinity,
                ),
                buildPlayButton(
                  'Play with bot',
                  height,
                  width,
                  context,
                  () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => BotConfigPage()));
                  },
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                buildPlayButton(
                  'Play with friend',
                  height,
                  width,
                  context,
                  () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => FriendConfigPage()));
                  },
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }

}
