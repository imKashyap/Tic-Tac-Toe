import 'package:flutter/material.dart';
import 'package:tic_tac_toe/screens/game_page.dart';
import 'package:tic_tac_toe/screens/info_page.dart';
import 'package:tic_tac_toe/utils/widgets.dart';

class BotConfigPage extends StatefulWidget {
  @override
  _BotConfigPageState createState() => _BotConfigPageState();
}

class _BotConfigPageState extends State<BotConfigPage> {
  String _selectedAvatar = '';
  List<String> levels = ['Easy', 'Intermediate', 'Hard'];
  int levelIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        elevation: 0.0,
      ),
      backgroundColor: Color(0xFF0B122F),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Select Level',
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () => _changeLevel('-'),
                child: Icon(
                  Icons.arrow_back_ios,
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.4,
                child: Text(
                  levels[levelIndex],
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                        color: Colors.grey,
                      ),
                ),
              ),
              GestureDetector(
                  onTap: () => _changeLevel('+'),
                  child: Icon(
                    Icons.arrow_forward_ios,
                  )),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 20.0,
            child: Divider(
              color: Colors.grey,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Text(
            'Select Avatar',
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () => _tapped('O'),
                child: Container(
                  decoration: BoxDecoration(
                      color: _selectedAvatar == 'O'
                          ? Color(0xFF003263)
                          : Color(0xFF03002D),
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.width * 0.25,
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: Text(
                    'O',
                    style: Theme.of(context).textTheme.headline4.copyWith(
                          //fontSize: MediaQuery.of(context).size.width*0.15,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => _tapped('X'),
                child: Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.width * 0.25,
                  width: MediaQuery.of(context).size.width * 0.25,
                  decoration: BoxDecoration(
                      color: _selectedAvatar == 'X'
                          ? Color(0xFF003263)
                          : Color(0xFF03002D),
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: Text(
                    'X',
                    style: Theme.of(context).textTheme.headline4.copyWith(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          buildPlayButton('Play', MediaQuery.of(context).size.height,
              MediaQuery.of(context).size.width, context, () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => GamePage()));
          }),
          // onTap: () {
          // if(_selectedAvatar!='')
          //  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>BotGamePage(levels[levelIndex],_selectedAvatar)));
          // else{
          //   showSimpleNotification (Text('Select an Avatar first.',
          //   style: kTextStyle.copyWith(
          //     color: Colors.white
          //   ),),
          //   background: Color(0xFF003263));
          // }
        ],
      ),
    );
  }

  void _tapped(String avatar) {
    setState(() {
      _selectedAvatar = avatar;
    });
  }

  void _changeLevel(String op) {
    setState(() {
      if (op == '+') {
        if (levelIndex == 2)
          levelIndex = 0;
        else
          levelIndex++;
      } else {
        if (levelIndex == 0)
          levelIndex = 2;
        else
          levelIndex--;
      }
    });
  }
}
