import 'package:flutter/material.dart';
import 'package:tic_tac_toe/utils/field.dart';

Widget buildPlayButton(String text, double height, double width,
    BuildContext context, Function onPressed) {
  return OutlinedButton(
    onPressed: onPressed,
    child: Container(
      alignment: Alignment.center,
      width: width * 0.65,
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.05, vertical: height * 0.025),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
    ),
    style: ButtonStyle(
        shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
            (Set<MaterialState> states) => RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                )),
        side: MaterialStateProperty.resolveWith<BorderSide>(
          (Set<MaterialState> states) => BorderSide(color: Colors.blueGrey),
        )),
  );
}

Widget buildSocialButton(String path) {
  double scale = 30;
  if (path == 'assets/icons/linkedin.png')
    scale = 34;
  else if (path == 'assets/icons/gmail.png') scale = 27;
  return InkWell(
    onTap: () {},
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueGrey),
        shape: BoxShape.circle,
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Image.asset(
          path,
          scale: scale,
          color: Colors.grey,
        ),
      ),
    ),
  );
}

AppBar buildCustomAppBar(BuildContext context, Function onPressed) {
  return AppBar(
    leading: GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(
                    'Confirm Exit',
                    style: Theme.of(context).textTheme.headline6.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  content: Text(
                    'Do you really want to exit?',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  actions: <Widget>[
                    TextButton(
                        child: Text(
                          'Yes',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        onPressed: onPressed),
                    TextButton(
                      child: Text(
                        'No',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    )
                  ],
                ));
      },
      child: Icon(Icons.arrow_back),
    ),
    backgroundColor: Color(0xFF0B122F),
    elevation: 0.0,
  );
}

Widget buildGameBoard() {
  return GridView.count(
    crossAxisCount: 3,
    children: List.generate(9, (idx) {
      return Field(idx: idx, onTap: (int num) {}, playerSymbol: 'X');
    }),
  );
}

  Widget _buildResetButton(String text, double width) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: width * 0.05),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 50.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blueGrey),
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
        ),
        child: Container(
          alignment: Alignment.center,
          width: width * 0.5,
          child: Text(
            text,
            style: kTextStyle,
          ),
        ),
      ),
    );
  }

  // showADialogBox(String winner) {
  //   String text;
  //   if (winner == 'y')
  //     text = 'Hurray! You won.';
  //   else if (winner == 'd')
  //     text = 'Nice Try! It\'s a draw.';
  //   else
  //     text = 'Sorry, You lost!';
  //   return showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       content: Text(
  //         text,
  //         style: kTextStyle,
  //       ),
  //       actions: <Widget>[
  //         RaisedButton(
  //           onPressed: () {
  //             setState(() {
  //               needResseting = true;
  //               showReset = true;
  //               resetContainer = _buildResetButton(
  //                   'Reset', MediaQuery.of(context).size.width);
  //               totalMatch++;
  //               if (winner == 'y')
  //                 playerWins++;
  //               else if (winner == 'n') botWins++;
  //             });
  //             Navigator.of(context).pop();
  //           },
  //           child: Text(
  //             'OK',
  //             style: kTextStyle,
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }

  Widget buuldScoreBoard(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      color: Color(0xFF2A3251),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _scoreCard('You', playerWins.toString()),
          SizedBox(
            width: 20.0,
            height: MediaQuery.of(context).size.height * 0.09,
            child: VerticalDivider(
              color: Colors.grey,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                'Game(s)',
                style: kTextStyle.copyWith(
                    fontSize: MediaQuery.of(context).size.height * 0.02,
                    color: Colors.grey),
              ),
              Text(
                totalMatch.toString(),
                style: kTextStyle.copyWith(color: Colors.grey),
              ),
              Text(
                'completed',
                style: kTextStyle.copyWith(
                  color: Colors.grey,
                  fontSize: MediaQuery.of(context).size.height * 0.02,
                ),
              )
            ],
          ),
          SizedBox(
            width: 20.0,
            height: MediaQuery.of(context).size.height * 0.09,
            child: VerticalDivider(
              color: Colors.grey,
            ),
          ),
          _scoreCard('Bot', botWins.toString()),
        ],
      ),
    );
  }

  Widget _scoreCard(String player, String wins) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          player,
          style: kTextStyle.copyWith(
            fontSize: MediaQuery.of(context).size.height * 0.023,
          ),
        ),
        Text(
          wins,
          style: kTextStyle.copyWith(
            fontSize: MediaQuery.of(context).size.height * 0.07,
          ),
        )
      ],
    );
  }

  Widget _options() {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _optionBuilder(Icons.refresh, () {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: Text(
                        'Confirm Rematch',
                        style: kTextStyle.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      content: Text(
                        'Do you really want to Rematch?',
                        style: kTextStyle,
                      ),
                      actions: <Widget>[
                        RaisedButton(
                            child: Text(
                              'Yes',
                              style: kTextStyle,
                            ),
                            onPressed: () {
                              setState(() {
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
                              Navigator.of(context).pop();
                            }),
                        RaisedButton(
                          child: Text(
                            'No',
                            style: kTextStyle,
                          ),
                          onPressed: () => Navigator.of(context).pop(),
                        )
                      ],
                    ));
          }),
          _optionBuilder(Icons.undo, () {
            if(playerPreviousIndex!=-1)
            setState(() {
              displayXO[playerPreviousIndex] = '';
              displayXO[botPreviousIndex] = '';
            });
          }),
        ],
      ),
    );
  }

  Widget _optionBuilder(IconData icon, Function whatToDo) {
    return GestureDetector(
      onTap: whatToDo,
      child: Icon(
        icon,
        size: MediaQuery.of(context).size.height * 0.04,
      ),
    );
  }
