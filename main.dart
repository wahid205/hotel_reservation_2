import 'package:flutter/material.dart';
import 'package:flutter_application_2/view/home.dart';
import 'package:flutter_application_2/view/signup.dart';


import 'package:provider/provider.dart';

import 'model/data.dart';
import 'model/datamanage.dart';
import 'model/personal.dart';
import 'widget/google_signin.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
Future<void> main() async {
    
    
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    
  };
  PlatformDispatcher.instance.onError = (error, stack) {
    
    return true;
  };
  runApp(MultiProvider(  providers: [
        ChangeNotifierProvider(
      create: (context) {
        return HotelData();
      },),
      ChangeNotifierProvider(
      create: (context) {
        return PersonalData();
      },),
      ChangeNotifierProvider(
      create: (context) {
        return GoogleSignInProvider();
      },),
      ChangeNotifierProvider(
      create: (context) {
        return DataManagement();
      },)
      ],
      child: const MyApp(),
      ),
  );
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, widget) {
        Widget error = const Text('...rendering error...');
        if (widget is Scaffold || widget is Navigator) {
          error = Scaffold(body: Center(child: error));
        }
        ErrorWidget.builder = (errorDetails) => error;
        if (widget != null) return widget;
        throw ('widget is null');
      },
      home: Signup(),
    );
  }
}