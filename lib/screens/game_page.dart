import 'package:flutter/material.dart';
import 'package:tic_tac_toe/screens/bot_config_page.dart';
import 'package:tic_tac_toe/utils/widgets.dart';

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0B122F),
      appBar: buildCustomAppBar(
        context,
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => BotConfigPage())),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Container(height:  MediaQuery.of(context).size.height * 0.5, child: buildGameBoard()),
            Spacer(),
            !showReset
                    ? _options()
                    : GestureDetector(
                        onTap: () {
                          setState(() {
                            needResseting = false;
                            showReset = false;
                            displayXO = [
                              '',
                              '',
                              '',
                              '',
                              '',
                              '',
                              '',
                              '',
                              '',
                            ];
                          });
                        },
                        child: resetContainer),
                _scoreBoard(),
          ],
        ),
      ),
    );
  }
}
