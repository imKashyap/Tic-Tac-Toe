import 'package:flutter/material.dart';
import 'package:tic_tac_toe/screens/info_page.dart';

class FriendConfigPage extends StatefulWidget {
  @override
  _FriendConfigPageState createState() => _FriendConfigPageState();
}

class _FriendConfigPageState extends State<FriendConfigPage> {
  TextEditingController player1 = TextEditingController();
  TextEditingController player2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0B122F),
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
      ),
      backgroundColor: Color(0xFF0B122F),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            buildTextField(
                'Player X ', player1, MediaQuery.of(context).size.width),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            buildTextField(
                'Player O', player2, MediaQuery.of(context).size.width),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            GestureDetector(
                onTap: () {
                  // if(player1.text.trim()==''||player2.text.trim()==''){
                  //   showSimpleNotification (Text('Name field(s) can\'t be empty.',
                  //     style: kTextStyle.copyWith(
                  //         color: Colors.white
                  //     ),),
                  //       background: Color(0xFF003263));
                  // }
                  // else if(player1.text.trim()==player2.text.trim()){
                  //   showSimpleNotification (Text('Name fields can\'t be same.',
                  //     style: kTextStyle.copyWith(
                  //         color: Colors.white
                  //     ),),
                  //       background: Color(0xFF003263));
                  // }
                  // else{
                  //   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>FriendGamePage(player1.text.trim(),player2.text.trim())));
                  // }
                },
                child:
                    _buildPlayButton('Play', MediaQuery.of(context).size.width))
          ],
        ),
      ),
    );
  }

  buildTextField(
      String label, TextEditingController playerController, double width) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width * 0.12),
      child: TextField(
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline6,
        controller: playerController,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.person),
          focusColor: Colors.blueGrey,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blueGrey[900]),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blueGrey),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          labelText: label,
          labelStyle: Theme.of(context).textTheme.headline6.copyWith(
                color: Colors.grey[500],
              ),
        ),
      ),
    );
  }

  Widget _buildPlayButton(String text, double width) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width * 0.12),
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
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
      ),
    );
  }
}
