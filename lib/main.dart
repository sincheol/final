import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:learningdart/firebase_options.dart';
import 'package:learningdart/views/login_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    )
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder:(context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              final user = FirebaseAuth.instance.currentUser;
              if(user?.emailVerified ?? false){
                print('you are verified user');
              }
              else{
                print('you need to verify your email first');
              }
              return const Text('Done');
              default:
                return const Text('Loading...');
          }
        }, 
      ),
    );
  }
}


void MA_7to50(){
  //Moving Average
  //if 7 days moving average break through 50 days moving average
  // than alert to user!
  //else keep monitoring
}
void MA_15to90(){
  //Moving Average
  //if 15 days moving average break through 90 days moving average
  // than alert to user!
  //else keep monitoring
}
void BB_bt(){
  //Bollinger Band upper break through
  //if day off price >= upper band && yesterday MACD << today MACD
  //than alert to user!
  //else keep monitoring
}
void DI_60(){
  //60 days Disparity Index
  //if disparity index < 90
  //than alert to user!
  //else keep monitoring
}
void MT_bull(){
  //Momentum trading when market is in a bull
  //if All moving average is in a bull
  //than alert to user!
  //else keep monitoring
}
