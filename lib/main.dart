import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tic_tac_toe/screens/landing_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      title: 'Wally',
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'GoogleSans',
      ),
      debugShowCheckedModeBanner: false,
      home: LandingPage(),
    );
  }
}

// class SplashScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           SizedBox(
//             height: 200.0,
//           ),
//           Image.asset(
//             'assets/icons/logo.png',
//             scale: 4,
//           ),
//           SizedBox(
//             height: 70.0,
//           ),
//           Text(
//             'Tic Tac Toe',
//             textAlign: TextAlign.center,
//             style: Theme.of(context).textTheme.headline4.copyWith(
//                   fontSize: 29.0,
//                   color: Colors.white.withOpacity(0.25),
//                   fontWeight: FontWeight.w600,
//                 ),
//           )
//         ],
//       ),
//     );
//   }
// }
