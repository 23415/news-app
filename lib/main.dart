import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/InternetBloc.dart';
import 'package:news_app/bloc/screens/loginpage.dart';
import 'package:news_app/bloc/screens/verify.dart';

import 'bloc/screens/HomePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InternetBloc(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: 'phone',
          routes: {
            'phone': (context) => LoginPage(),
            'verify': (context) => MyVerify(),
            'home': (context) => HomePage(),
          }),
    );
  }
}
